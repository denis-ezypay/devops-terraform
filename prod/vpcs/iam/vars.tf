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
variable "number_of_az"                    {}
variable "prefix-list-id"                  {}
variable "region"                          {}

variable "nat-instances" {
  type = "map"

  default = {
    staging-private-a = "i-0743317e7482b28f3"
    staging-private-b = "i-0b8a093169f9165f2"
    staging-private-c = "i-0a46cfa90dd7d1318"
    sydney-private-a = "i-02bd69e468f0b1346"
    sydney-private-b = "i-0ea7cf96d368e2548"
    sydney-private-c = "i-0042900402303caab"
  }
}

variable "nat-network-interfaces" {
  type = "map"

  default = {
    staging-private-a = "eni-9c2d7ce6"
    staging-private-b = "eni-d254809e"
    staging-private-c = "eni-e3cf47bb"
    sydney-private-a = "eni-b8dd96c2"
    sydney-private-b = "eni-44d61f08"
    sydney-private-c = "eni-e3da54bb"
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
  vpc_id = "${aws_vpc.IAM-vpc.id}"
  tags {
    Tier = "Private"
  }
}

data "aws_subnet_ids" "private-1" {
  vpc_id = "${aws_vpc.IAM-vpc.id}"
  tags {
    Tier = "Private"
    Block = 1
  }
}

data "aws_subnet_ids" "private-2" {
  vpc_id = "${aws_vpc.IAM-vpc.id}"
  tags {
    Tier = "Private"
    Block = 2
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = "${aws_vpc.IAM-vpc.id}"
  tags {
    Tier = "Public"
  }
}

# Outputs for security groups which are accessed by different VPCs
output "management-sg" {
  value = "${aws_security_group.iam-vpc-IAM-Management.id}"
}

output "service-sg" {
  value = "${aws_security_group.iam-vpc-IAM-Service.id}"
}

output "web-sg" {
  value = "${aws_security_group.iam-vpc-IAM-Web.id}"
}
