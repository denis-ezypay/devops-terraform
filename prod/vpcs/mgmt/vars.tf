variable "cb-management-sg"                {}
variable "cb-postgres-sg"                  {}
variable "cb-rabbitmq-sg"                  {}
variable "iam-management-sg"               {}
variable "iam-service-sg"                  {}
variable "iam-web-sg"                      {}
variable "vault-api-sg"                    {}
variable "vault-batch-sg"                  {}
variable "vault-config-sg"                 {}
variable "vault-db-sg"                     {}
variable "vault-engine-sg"                 {}
variable "vault-gateway-sg"                {}
variable "vault-management-sg"             {}
variable "vault-ui-sg"                     {}
variable "vault-web-sg"                    {}
variable "number_of_az"                    {}
variable "prefix-list-id"                  {}
variable "region"                          {}

variable "nat-instances" {
  type = "map"

  default = {
    staging-private = "i-0d46068d5290657e8"
    sydney-private = "i-0b8e2d202e189f729"
  }
}

variable "nat-network-interfaces" {
  type = "map"

  default = {
    staging-private = "eni-014b007b"
    sydney-private = "eni-5e783224"
  }
}

# Outputs for security groups which are accessed by different VPCs
output "deploy-sg" {
  value = "${aws_security_group.mgmt-vpc-Mgmt-Deploy.id}"
}

output "ossec-sg" {
  value = "${aws_security_group.mgmt-vpc-Mgmt-OSSEC.id}"
}

output "bastion-sg" {
  value = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Bastion.id}"
}

output "kibana-sg" {
  value = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Kibana.id}"
}

output "ldap-sg" {
  value = "${aws_security_group.mgmt-vpc-Vault-Mgmt-LDAP.id}"
}

output "nagios-sg" {
  value = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nagios.id}"
}

output "nessus-sg" {
  value = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Nessus.id}"
}

output "ntp-sg" {
  value = "${aws_security_group.mgmt-vpc-Vault-Mgmt-NTP.id}"
}

output "repo-sg" {
  value = "${aws_security_group.mgmt-vpc-Vault-Mgmt-Repo.id}"
}

output "sftp-sg" {
  value = "${aws_security_group.mgmt-vpc-Vault-Mgmt-SFTP.id}"
}

output "vpn-sg" {
  value = "${aws_security_group.mgmt-vpc-Mgmt-VPN.id}"
}
