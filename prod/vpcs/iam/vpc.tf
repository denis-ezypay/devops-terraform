resource "aws_vpc" "IAM-vpc" {
    cidr_block           = "10.53.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags {
        "Name" = "${terraform.env}-IAM-vpc"
    }
}

output "vpc.id" {
  value = "${aws_vpc.IAM-vpc.id}"
}
