# Inputs to this module
variable "logging-bucket"                  {}
variable "mgmt-deploy-sg"                  {}
variable "mgmt-ossec-sg"                   {}
variable "mgmt-bastion-sg"                 {}
variable "mgmt-kibana-sg"                  {}
variable "mgmt-ldap-sg"                    {}
variable "mgmt-nagios-sg"                  {}
variable "mgmt-nessus-sg"                  {}
variable "mgmt-ntp-sg"                     {}
variable "mgmt-repo-sg"                    {}
variable "mgmt-sftp-sg"                    {}
variable "number_of_az"                    {}
variable "prefix-list-id"                  {}
variable "region"                          {}

variable "nat-instances" {
  type = "map"

  default = {
    staging-private-a = "i-051d7cda30c509291"
    sydney-private-a = "i-03584afccd1d7fa36"
  }
}

variable "nat-network-interfaces" {
  type = "map"

  default = {
    staging-private-a = "eni-09257473"
    sydney-private-a = "eni-ead69d90"
  }
}

variable "ssl-certificate-names" {
  type = "map"

  default = {
    dev1    = "2017-Ezypay-Reissue"
    sandbox = "2017-Ezypay-Reissue"
    staging = "2017-Ezypay-Reissue"
    sydney = "ezypaycert"
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = "${aws_vpc.vault-vpc.id}"
  tags {
    Tier = "Private"
  }
}

data "aws_subnet_ids" "private-1" {
  vpc_id = "${aws_vpc.vault-vpc.id}"
  tags {
    Tier = "Private"
    Block = 1
  }
}

data "aws_subnet_ids" "private-2" {
  vpc_id = "${aws_vpc.vault-vpc.id}"
  tags {
    Tier = "Private"
    Block = 2
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = "${aws_vpc.vault-vpc.id}"
  tags {
    Tier = "Public"
  }
}

# data "aws_vpc_endpoint" "s3" {
#   vpc_id       = "${aws_vpc.vault-vpc.id}"
# }

# Outputs for security groups which are accessed by different VPCs
output "api-sg" {
  value = "${aws_security_group.vault-vpc-Vault-API.id}"
}

output "batch-sg" {
  value = "${aws_security_group.vault-vpc-Vault-Batch.id}"
}

output "config-sg" {
  value = "${aws_security_group.vault-vpc-Vault-Config.id}"
}

output "db-sg" {
  value = "${aws_security_group.vault-vpc-Vault-DB.id}"
}

output "engine-sg" {
  value = "${aws_security_group.vault-vpc-Vault-Engine.id}"
}

output "gateway-sg" {
  value = "${aws_security_group.vault-vpc-Vault-Gateway.id}"
}

output "management-sg" {
  value = "${aws_security_group.vault-vpc-Vault-Management.id}"
}

output "ui-sg" {
  value = "${aws_security_group.vault-vpc-Vault-UI.id}"
}

output "web-sg" {
  value = "${aws_security_group.vault-vpc-Vault-Web.id}"
}
