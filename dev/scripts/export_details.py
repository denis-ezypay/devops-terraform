import sys
import boto3

prompt_text = "Which profile do you want to use? {available_profiles}: "
profile_name = sys.argv[1] if len(sys.argv) > 1 else raw_input(prompt_text.format(available_profiles=boto3.Session().available_profiles))

session = boto3.Session(profile_name=profile_name)
ec2 = session.client('ec2', region_name='ap-southeast-2')

print "{vpc_id:15} | {id:15} | {name} ".format(vpc_id='VPC ID', name='Name', id='ID')
for sg in sorted(ec2.describe_security_groups()['SecurityGroups'], key=lambda k: k['VpcId']+k['GroupId']):
  print "{vpc_id:15} | {id:15} | '{name}'".format(vpc_id=sg['VpcId'],name=sg['GroupName'], id=sg['GroupId'])

print "{vpc_id:15} | {id:15} | {name} ".format(vpc_id='VPC ID', name='Name', id='ID')
for sn in sorted(ec2.describe_subnets()['Subnets'], key=lambda k: k['VpcId']+k['SubnetId']):
  tags = dict(map(lambda x: (x['Key'], x['Value']), sn.get('Tags', [])))
  name = tags.get('Name', None)
  print "{vpc_id:15} | {id:15} | '{name}'".format(vpc_id=sn['VpcId'],name=name, id=sn['SubnetId'])
