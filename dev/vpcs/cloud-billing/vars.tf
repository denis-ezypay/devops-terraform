# Inputs to this module
variable "logging-bucket"                  {}
variable "mgmt-deploy-sg"                  {}
variable "mgmt-bastion-sg"                 {}
variable "mgmt-kibana-sg"                  {}
variable "mgmt-ldap-sg"                    {}
variable "mgmt-ntp-sg"                     {}
variable "mgmt-repo-sg"                    {}
variable "mgmt-vpn-sg"                     {}
variable "number_of_az" {}

variable "nat-instances" {
  type = "map"

  default = {
    staging-private-a = "i-0ead0a1b1a412c863"
    staging-private-b = "i-0d96d8ce1bb7a3b8b"
    staging-private-c = "i-00586c5493a480970"
    sydney-private-a = "i-0d03114fa2c2b9d16"
    sydney-private-b = "i-025dc5afc2037815f"
    sydney-private-c = "i-036c3127150ace761"
  }
}

variable "nat-network-interfaces" {
  type = "map"

  default = {
    staging-private-a = "eni-a72a7bdd"
    staging-private-b = "eni-cf568283"
    staging-private-c = "eni-a1c149f9"
    sydney-private-a = "eni-50e0f61d"
    sydney-private-b = "eni-7b40d001"
    sydney-private-c = "eni-d1fc4189"
  }
}

variable "ssl-certificate-names" {
  type = "map"

  default = {
    dev1    = "2017-Ezypay-Reissue"
    sandbox = "2017-Ezypay-Reissue"
    staging = "2017-Ezypay-Reissue"
    sydney = "ezypayCert2018"
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = "${aws_vpc.cb-vpc.id}"
  tags {
    Tier = "Private"
  }
}

data "aws_subnet_ids" "private-1" {
  vpc_id = "${aws_vpc.cb-vpc.id}"
  tags {
    Tier = "Private"
    Block = 1
  }
}

data "aws_subnet_ids" "private-2" {
  vpc_id = "${aws_vpc.cb-vpc.id}"
  tags {
    Tier = "Private"
    Block = 2
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = "${aws_vpc.cb-vpc.id}"
  tags {
    Tier = "Public"
  }
}

# Outputs for security groups which are accessed by different VPCs
output "management-sg" {
  value =  "${aws_security_group.cb-management.id}"
}

output "postgres-sg" {
  value = "${aws_security_group.cb-Postgres.id}"
}

output "rabbitmq-sg" {
  value = "${aws_security_group.cb-Rabbit.id}"
}

variable "rancher_count" {
  type = "map"

  default = {
    dev1    = 1
    sandbox = 0
    staging = 0
    sydney  = 0
   }
}

variable docker_ami {
  type    = "map"

  default = {
  dev1        = "ami-6d276c0e"
  staging     = "ami-b75ab4d5"
  }
}

variable rancher_url {
  type    = "map"

  default = {
  dev1        = "https://rancher-dev.ezypay.com/v1/scripts/F8D8FA3445CA83524DFE:1483142400000:hBJSUEE6n60DBklY4Mj0LX5j0Q"
  staging     = "https://rancher-staging.ezypay.com"
  }
}

variable root_user {
  default = "ezypayadmin"
}

variable key {
  type = "map"

  default = {
    dev1     = "ez-dev1-key"
    staging  = "ezystaging-key"
  }

}

variable default_instance_profile {
  default = "Ec2S3Access"
}

variable rancher_instance_size {
  default = "t2.medium"
}

variable group_name {
  default = "app"
}

variable kubernetes_instance_size {
  default = "m3.large"
}
