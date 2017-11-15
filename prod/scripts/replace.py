#! /usr/bin/env python

# import sys
# import boto3

# prompt_text = "Which profile do you want to use? {available_profiles}: "
# profile_name = sys.argv[1] if len(sys.argv) > 1 else raw_input(prompt_text.format(available_profiles=boto3.Session().available_profiles))

# session = boto3.Session(profile_name=profile_name)
# ec2 = session.client('ec2', region_name='ap-southeast-2')

# print "{vpc_id:15} | {id:15} | {name} ".format(vpc_id='VPC ID', name='Name', id='ID')
# for sg in sorted(ec2.describe_security_groups()['SecurityGroups'], key=lambda k: k['VpcId']+k['GroupId']):
#   print "{vpc_id:15} | {id:15} | '{name}'".format(vpc_id=sg['VpcId'],name=sg['GroupName'], id=sg['GroupId'])

# print "{vpc_id:15} | {id:15} | {name} ".format(vpc_id='VPC ID', name='Name', id='ID')
# for sn in sorted(ec2.describe_subnets()['Subnets'], key=lambda k: k['VpcId']+k['SubnetId']):
#   tags = dict(map(lambda x: (x['Key'], x['Value']), sn['Tags'] or []))
#   name = tags.get('Name', None)
#   print "{vpc_id:15} | {id:15} | '{name}'".format(vpc_id=sn['VpcId'],name=name, id=sn['SubnetId'])


security_groups = {
  "sg-081b4c6f": "${aws_security_group.mgmt-vpc-staging-mgmt-AlienVaultSensor-USMConnectionSG-4QHODGSRPDM7.id}",
  "sg-0bf0b66c": "${aws_security_group.mgmt-vpc-Mgmt-Deploy.id}",
  "sg-42572225": "${aws_security_group.mgmt-vpc-Mgmt-Shearwater.id}",
  "sg-56db2431": "${aws_security_group.mgmt-vpc-Vault-Mgmt-Bastion.id}",
  "sg-5e194e39": "${aws_security_group.mgmt-vpc-staging-mgmt-AlienVaultSensor-USMBaseSG-1WHJ08N7V3CSP.id}",
  "sg-c67e56a1": "${aws_security_group.mgmt-vpc-staging-mgmt-AlienVaultSensor-USMBaseSG-BPKI9GI8L0DL.id}",
  "sg-6535ca02": "${aws_security_group.mgmt-vpc-Vault-Mgmt-NTP.id}",
  "sg-6ff10f08": "${aws_security_group.mgmt-vpc-Vault-Mgmt-Kibana.id}",
  "sg-77de2110": "${aws_security_group.mgmt-vpc-Vault-Mgmt-NAT.id}",
  "sg-8236c9e5": "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nessus.id}",
  "sg-93f84df4": "${aws_security_group.mgmt-vpc-Mgmt-OSSEC.id}",
  "sg-a8c936cf": "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}",
  "sg-ac1a4dcb": "${aws_security_group.mgmt-vpc-staging-mgmt-AlienVaultSensor-USMServicesSG-PL1KGNA7OP7P.id}",
  "sg-4d70582a": "${aws_security_group.mgmt-vpc-staging-mgmt-AlienVaultSensor-USMConnectionSG-1T6148CSXO70V.id}",
  "sg-b244bad5": "${aws_security_group.mgmt-vpc-Vault-Mgmt-LDAP.id}",
  "sg-b434cbd3": "${aws_security_group.mgmt-vpc-Vault-Mgmt-SFTP.id}",
  "sg-cd8026aa": "${aws_security_group.mgmt-vpc-Mgmt-VPN.id}",
  "sg-ceed12a9": "${aws_security_group.mgmt-vpc-default.id}",
  "sg-d8de21bf": "${aws_security_group.mgmt-vpc-Vault-Mgmt-Repo.id}",
  "sg-f3dd2294": "${aws_security_group.mgmt-vpc-Vault-Mgmt-Management.id}",
  "sg-f7de2190": "${aws_security_group.mgmt-vpc-Vault-Mgmt-Internet-Access.id}",
  "sg-7df78a1a": "${aws_security_group.cloudformer-vpc-default.id}",
  "sg-b5f78ad2": "${aws_security_group.cloudformer-vpc-CloudFormer-WebServerSecurityGroup-90UE2QVDZ65P.id}",
  "sg-024cb265": "${aws_security_group.vault-vpc-Vault-Redis.id}",
  "sg-084cb26f": "${aws_security_group.vault-vpc-Vault-NAT.id}",
  "sg-204cb247": "${aws_security_group.vault-vpc-Vault-UI-ELB.id}",
  "sg-274db340": "${aws_security_group.vault-vpc-Vault-API-ELB.id}",
  "sg-2c4db34b": "${aws_security_group.vault-vpc-Vault-API.id}",
  "sg-3d4cb25a": "${aws_security_group.vault-vpc-Vault-UI.id}",
  "sg-464db321": "${aws_security_group.vault-vpc-Vault-DB.id}",
  "sg-494db32e": "${aws_security_group.vault-vpc-Vault-Config.id}",
  "sg-4d4cb22a": "${aws_security_group.vault-vpc-Vault-Web.id}",
  "sg-5035ca37": "${aws_security_group.vault-vpc-Vault-Management.id}",
  "sg-524db335": "${aws_security_group.vault-vpc-Vault-Batch.id}",
  "sg-624db305": "${aws_security_group.vault-vpc-Vault-ELB-External.id}",
  "sg-6a31830d": "${aws_security_group.vault-vpc-Vault-Config-ELB.id}",
  "sg-884cb2ef": "${aws_security_group.vault-vpc-Vault-Engine.id}",
  "sg-8d4cb2ea": "${aws_security_group.vault-vpc-Vault-Engine-ELB.id}",
  "sg-a14cb2c6": "${aws_security_group.vault-vpc-Vault-Gateway-ELB.id}",
  "sg-be4cb2d9": "${aws_security_group.vault-vpc-Vault-Gateway.id}",
  "sg-d14cb2b6": "${aws_security_group.vault-vpc-Vault-Internet-Access.id}",
  "sg-d538c7b2": "${aws_security_group.vault-vpc-default.id}",
  "sg-247dea43": "${aws_security_group.iam-vpc-IAM-Web.id}",
  "sg-647ee903": "${aws_security_group.iam-vpc-IAM-ELB-External.id}",
  "sg-6a02950d": "${aws_security_group.iam-vpc-IAM-Service-ELB.id}",
  "sg-9571e6f2": "${aws_security_group.iam-vpc-IAM-Redis.id}",
  "sg-9d79eefa": "${aws_security_group.iam-vpc-IAM-Internet-Access.id}",
  "sg-a470e7c3": "${aws_security_group.iam-vpc-IAM-Service.id}",
  "sg-c67deaa1": "${aws_security_group.iam-vpc-IAM-Cassandra.id}",
  "sg-caad38ad": "${aws_security_group.iam-vpc-default.id}",
  "sg-ce6212a9": "${aws_security_group.iam-vpc-IAM-Shearwater.id}",
  "sg-f07ceb97": "${aws_security_group.iam-vpc-IAM-Management.id}",
  "sg-fd7aed9a": "${aws_security_group.iam-vpc-IAM-NAT.id}",
  "sg-08e4246f": "${aws_security_group.staging-vpc-staging-SG-UI.id}",
  "sg-09e4246e": "${aws_security_group.staging-vpc-staging-SG-Gateway.id}",
  "sg-0ae4246d": "${aws_security_group.staging-vpc-staging-SG-Registry.id}",
  "sg-0ba46c6c": "${aws_security_group.staging-vpc-staging-SG-API02-elb.id}",
  "sg-0be4246c": "${aws_security_group.staging-vpc-staging-SG-rabbitmq-elb.id}",
  "sg-0ce4246b": "${aws_security_group.staging-vpc-staging-SG-ui01-elb.id}",
  "sg-0ee42469": "${aws_security_group.staging-vpc-staging-SG-nginx-elb.id}",
  "sg-0fe42468": "${aws_security_group.staging-vpc-staging-SG-gateway-elb.id}",
  "sg-10e42477": "${aws_security_group.staging-vpc-staging-SG-Postgres.id}",
  "sg-12e42475": "${aws_security_group.staging-vpc-staging-SG-Cassandra.id}",
  "sg-13e42474": "${aws_security_group.staging-vpc-staging-SG-Rabbit.id}",
  "sg-14943173": "${aws_security_group.staging-vpc-staging-SG-Nagios.id}",
  "sg-14e42473": "${aws_security_group.staging-vpc-staging-SG-Kibana.id}",
  "sg-15e42472": "${aws_security_group.staging-vpc-staging-SG-API02.id}",
  "sg-16e42471": "${aws_security_group.staging-vpc-staging-SG-API01.id}",
  "sg-17e42470": "${aws_security_group.staging-vpc-staging-SG-Batch.id}",
  "sg-7f669c18": "${aws_security_group.staging-vpc-SG-api01-elb.id}",
  "sg-83609ae4": "${aws_security_group.staging-vpc-SG-gateway-elb.id}",
  "sg-8b7ce0ec": "${aws_security_group.staging-vpc-staging-SG-postgREST.id}",
  "sg-926eaaf5": "${aws_security_group.staging-vpc-staging-SG-NAT.id}",
  "sg-936eaaf4": "${aws_security_group.staging-vpc-staging-SG-Nginx.id}",
  "sg-946eaaf3": "${aws_security_group.staging-vpc-staging-SG-Bastion.id}",
  "sg-9feb28f8": "${aws_security_group.staging-vpc-staging-bill-management.id}",
  "sg-ab30f7cc": "${aws_security_group.staging-vpc-CentOS 7 (x86_64) - with Updates HVM-1602-AutogenByAWSMP-.id}",
  "sg-beb77cd9": "${aws_security_group.staging-vpc-staging-SG-Redis.id}",
  "sg-c86818af": "${aws_security_group.staging-vpc-Syd-Shearwater.id}",
  "sg-cd6399aa": "${aws_security_group.staging-vpc-SG-external-elb.id}",
  "sg-dba46dbc": "${aws_security_group.staging-vpc-staging-SG-config-elb.id}",
  "sg-f6448091": "${aws_security_group.staging-vpc-SG-ui01-elb.id}"
}

subnet_ids = {
  '"subnet-ef8d9ba9"': '"${aws_subnet.subnet-ef8d9ba9-subnet-ef8d9ba9.id}"',
  '"subnet-72535505"': '"${aws_subnet.subnet-72535505-subnet-72535505.id}"',
  '"subnet-fa92889f"': '"${aws_subnet.subnet-fa92889f-subnet-fa92889f.id}"',
  '"subnet-c1df54a5"': '"${aws_subnet.subnet-mgmt-staging-mgmt-subnet-public.id}"',
  '"subnet-cbdf54af"': '"${aws_subnet.subnet-mgmt-staging-mgmt-subnet-private.id}"',
  '"subnet-79aefb1d"': '"${aws_subnet.subnet-subnet-79aefb1d.id}"',
  '"subnet-5002b226"': '"${aws_subnet.subnet-vault-staging-Subnet-Private-B1.id}"',
  '"subnet-50ea3009"': '"${aws_subnet.subnet-vault-staging-Subnet-Public-C1.id}"',
  '"subnet-5102b227"': '"${aws_subnet.subnet-vault-staging-Subnet-Private-B2.id}"',
  '"subnet-51ea3008"': '"${aws_subnet.subnet-vault-staging-Subnet-Private-C2.id}"',
  '"subnet-5302b225"': '"${aws_subnet.subnet-vault-staging-Subnet-Public-B1.id}"',
  '"subnet-53ea300a"': '"${aws_subnet.subnet-vault-staging-Subnet-Private-C1.id}"',
  '"subnet-83e46fe7"': '"${aws_subnet.subnet-vault-staging-Subnet-Public-A1.id}"',
  '"subnet-8ce46fe8"': '"${aws_subnet.subnet-vault-staging-Subnet-Private-A1.id}"',
  '"subnet-8de46fe9"': '"${aws_subnet.subnet-vault-staging-Subnet-Private-A2.id}"',
  '"subnet-10b70f49"': '"${aws_subnet.subnet-iam-staging-IAM-subnet-public-C1.id}"',
  '"subnet-1db70f44"': '"${aws_subnet.subnet-iam-staging-IAM-subnet-private-C2.id}"',
  '"subnet-36433c52"': '"${aws_subnet.subnet-iam-staging-IAM-subnet-private-A1.id}"',
  '"subnet-48c7a73e"': '"${aws_subnet.subnet-iam-staging-IAM-subnet-public-B1.id}"',
  '"subnet-9dcbabeb"': '"${aws_subnet.subnet-iam-staging-IAM-subnet-private-B2.id}"',
  '"subnet-b2453ad6"': '"${aws_subnet.subnet-iam-staging-IAM-subnet-public-A1.id}"',
  '"subnet-cec8a8b8"': '"${aws_subnet.subnet-iam-staging-IAM-subnet-private-B1.id}"',
  '"subnet-d8a7d9bc"': '"${aws_subnet.subnet-iam-staging-IAM-subnet-private-A2.id}"',
  '"subnet-fba810a2"': '"${aws_subnet.subnet-iam-staging-IAM-subnet-private-C1.id}"',
  '"subnet-1360f577"': '"${aws_subnet.subnet-cb-staging-Subnet-Public-B1.id}"',
  '"subnet-1c60f578"': '"${aws_subnet.subnet-cb-staging-Subnet-Private-B1.id}"',
  '"subnet-1d60f579"': '"${aws_subnet.subnet-cb-staging-Subnet-Private-B2.id}"',
  '"subnet-6658e510"': '"${aws_subnet.subnet-cb-staging-Subnet-Private-A1.id}"',
  '"subnet-6758e511"': '"${aws_subnet.subnet-cb-staging-Subnet-Private-A2.id}"',
  '"subnet-7958e50f"': '"${aws_subnet.subnet-cb-staging-Subnet-Public-A1.id}"',
  '"subnet-80ec48d9"': '"${aws_subnet.subnet-cb-staging-Subnet-Private-C2.id}"',
  '"subnet-82ec48db"': '"${aws_subnet.subnet-cb-staging-Subnet-Private-C1.id}"',
  '"subnet-83ec48da"': '"${aws_subnet.subnet-cb-staging-Subnet-Public-C1.id}"'
}

# Clear out headers for subnet specific names
subnet_headers = {
  'subnet-c1df54a5-': 'subnet-mgmt-',
  'subnet-cbdf54af-': 'subnet-mgmt-',
  'subnet-79aefb1d-': 'subnet-',
  'subnet-5002b226-': 'subnet-vault-',
  'subnet-50ea3009-': 'subnet-vault-',
  'subnet-5102b227-': 'subnet-vault-',
  'subnet-51ea3008-': 'subnet-vault-',
  'subnet-5302b225-': 'subnet-vault-',
  'subnet-53ea300a-': 'subnet-vault-',
  'subnet-83e46fe7-': 'subnet-vault-',
  'subnet-8ce46fe8-': 'subnet-vault-',
  'subnet-8de46fe9-': 'subnet-vault-',
  'subnet-10b70f49-': 'subnet-iam-',
  'subnet-1db70f44-': 'subnet-iam-',
  'subnet-36433c52-': 'subnet-iam-',
  'subnet-48c7a73e-': 'subnet-iam-',
  'subnet-9dcbabeb-': 'subnet-iam-',
  'subnet-b2453ad6-': 'subnet-iam-',
  'subnet-cec8a8b8-': 'subnet-iam-',
  'subnet-d8a7d9bc-': 'subnet-iam-',
  'subnet-fba810a2-': 'subnet-iam-',
  'subnet-1360f577-': 'subnet-cb-',
  'subnet-1c60f578-': 'subnet-cb-',
  'subnet-1d60f579-': 'subnet-cb-',
  'subnet-6658e510-': 'subnet-cb-',
  'subnet-6758e511-': 'subnet-cb-',
  'subnet-7958e50f-': 'subnet-cb-',
  'subnet-80ec48d9-': 'subnet-cb-',
  'subnet-82ec48db-': 'subnet-cb-',
  'subnet-83ec48da-': 'subnet-cb-'
}

vpc_ids = {
  'vpc_id\s*=\s*"vpc-db874bbf"': 'vpc_id = "${aws_vpc.staging-vault-vpc.id}"',
  'vpc_id\s*=\s*"vpc-e1bc0f85"': 'vpc_id = "${aws_vpc.staging-IAM-vpc.id}"',
  'vpc_id\s*=\s*"vpc-5d62af39"': 'vpc_id = "${aws_vpc.staging-mgmt-vpc.id}"',
  'vpc_id\s*=\s*"vpc-624fc606"': 'vpc_id = "${aws_vpc.CloudformwerVPC.id}"',
  'vpc_id\s*=\s*"vpc-4e3cf22a"': 'vpc_id = "${aws_vpc.staging-vpc.id}"',
  'vpc_id\s*=\s*"vpc-4d466628"': 'vpc_id = "${aws_vpc.vpc-4d466628.id}"'

}

# replace prefix with name of vpc instead of id
sg_names = {
  "vpc-db874bbf": "vault-vpc",
  "vpc-e1bc0f85": "iam-vpc",
  "vpc-5d62af39": "mgmt-vpc",
  "vpc-624fc606": "cloudformer-vpc",
  "vpc-4e3cf22a": "staging-vpc",
  "vpc-4d466628": "vpc-4d466628"
}

igw_names = {
  'igw-48a4fa2d': "${aws_internet_gateway.staging-InternetGateway.id}",
  'igw-eba4af8e': "${aws_internet_gateway.cloudformer-internetGateway.id}",
  'igw-eebce28b': "${aws_internet_gateway.staging-mgmt-internetGateway.id}",
  'igw-ede8d388': "${aws_internet_gateway.staging-IAM-InternetGateway.id}",
  'igw-47fda522': "${aws_internet_gateway.staging-cb-InternetGateway.id}"
}

# replace the account ids with the new account where necessary
accounts = {
  '052346959408': '${var.account_id}',
  '413438936010': '${var.account_id}',
  '052346959408/': '', # remove vault prefix for security groups
  '413438936010/': ''  # remove cb prefix for security groups
}

# Replace instance arrays with blank arrays, this is handled differently in the replfunc
instances = {
  'instances\s*=\s*\[[\s\S]*]': 'instances = []'
}

# Remove the tag info relating to cloudformation
cf_stack_info_match = '\s*\"aws:cloudformation.[\s\S]*'
remove_cf_stack_info = {
  cf_stack_info_match: ''
}

all_replacements = {}
all_replacements.update(security_groups)
all_replacements.update(subnet_ids)
all_replacements.update(subnet_headers)
all_replacements.update(vpc_ids)
all_replacements.update(sg_names)
all_replacements.update(igw_names)
all_replacements.update(instances)
all_replacements.update(accounts)
all_replacements.update(remove_cf_stack_info)

import re
import os

remove_cf_stack_regex = re.compile(cf_stack_info_match)

def replfunc(match):
  actual_match = match.group(0)
  if actual_match.startswith('vpc_id'):
    return all_replacements[actual_match.replace(' ', '').replace('=', "\s*=\s*")]
  elif actual_match.startswith('instances'):
    return 'instances = []'
  elif remove_cf_stack_regex.match(actual_match):
    return ''
  else:
    return all_replacements[actual_match]

replace_files = ['sn.tf', 'nacl.tf', 'sg.tf', 'elb.tf']

for replacement_group in [security_groups, subnet_ids, subnet_headers, vpc_ids, sg_names, igw_names, instances, accounts, remove_cf_stack_info]:
  regex = re.compile('|'.join(x for x in replacement_group))
  for file_name in replace_files:
        with open(file_name, 'r') as file, open(file_name+'.updated','w') as output:
          for line in file:
            output.write(regex.sub(replfunc, line))

        os.remove(file_name)
        os.rename(file_name+'.updated', file_name)
