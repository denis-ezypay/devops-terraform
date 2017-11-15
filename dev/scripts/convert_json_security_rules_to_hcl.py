# Need to export to json first

import json
import hashlib
import copy
from pprint import pprint

file = open('sg.json')
data = json.load(file)
file.close()

def get_rule_description(rule, group_key, rule_type):
  rule_sha = hashlib.sha1(str(rule)).hexdigest()[:7]
  return "{rule[type]}_{rule[protocol]}_{rule[from_port]}_to_{rule[to_port]}_for_{group_key}_via_{rule_type}_{sha}".format(rule=rule, group_key=group_key, rule_type=rule_type, sha=rule_sha)

def print_rule(rule):
  for key in sorted(rule.keys()):
    value = rule[key]
    if type(value) is list:
      if len(value) > 0 and type(value[0]) is dict:
        for d in value:
          print '  {key} {{'.format(key=key)
          for k, v in d.iteritems():
            print '    "{k}" = "{v}"'.format(k=k, v=v)
          print '  }'
      else:
        print '  {key:25} = ["{value}"]'.format(key=key, value='", "'.join(value))
    elif type(value) is str or type(value) is unicode:
      print '  {key:25} = "{value}"'.format(key=key, value=value)
    elif type(value) is bool:
      print '  {key:25} = {value}'.format(key=key, value=str(value).lower())
    else:
      print '  {key:25} = {value}'.format(key=key, value=value)

def prepare_security_rules_for(incoming_rules, rule_type, security_group_id, group_key):
  output = []
  for incoming_rule in incoming_rules:
    incoming_rule['type'] = rule_type
    incoming_rule['security_group_id'] = security_group_id
    if 'security_groups' in incoming_rule.keys():
      sec_groups = incoming_rule.pop('security_groups')
      self_referencing = incoming_rule.pop('self')
      if self_referencing:
        new_rule = copy.deepcopy(incoming_rule)
        new_rule['self'] = True
        output.append(new_rule)

      for source_security_group_id in sec_groups:
        new_rule = copy.deepcopy(incoming_rule)
        new_rule['source_security_group_id'] = source_security_group_id
        output.append(new_rule)
    else:
      output.append(incoming_rule)

  for rule in output:
    rule_type = None
    if rule.get('source_security_group_id', None):
      rule_type = 'sg'
    elif rule.get('self', None):
      rule_type = 'self'
    else:
      rule_type = 'cidr'
    print 'resource "aws_security_group_rule" "{id}" {{'.format(id=get_rule_description(rule, group_key, rule_type))
    print_rule(rule)
    print '}\n'

sec_group_key = 'aws_security_group'

for resource_attr in data['resource']:
  resource = resource_attr[sec_group_key][0]
  resource_key = resource.keys()[0]
  attributes = resource[resource_key][0]

  if resource_key.endswith('-'):
    resource_key = resource_key[:-1]
  security_group_id = "${{{sec_group_key}.{resource_key}.id}}".format(sec_group_key=sec_group_key, resource_key=resource_key)

  incoming = attributes.pop('ingress', None)
  outgoing = attributes.pop('egress', None)

  name = attributes.get('name', None)
  if name and name == 'default':
    attributes['name'] = 'old-default'

  print 'resource "aws_security_group" "{resource_key}" {{'.format(resource_key=resource_key)
  print_rule(attributes)
  print '}\n'

  if incoming:
    print '# Incoming rules for {resource_key}:'.format(resource_key=resource_key)
    prepare_security_rules_for(incoming, 'ingress', security_group_id, resource_key)

  if outgoing:
    print '# Outgoing rules for {resource_key}:'.format(resource_key=resource_key)
    prepare_security_rules_for(outgoing, 'egress', security_group_id, resource_key)

