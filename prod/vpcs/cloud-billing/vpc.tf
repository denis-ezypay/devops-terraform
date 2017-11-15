resource "aws_vpc" "cb-vpc" {
    cidr_block           = "10.50.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags {
        "Name" = "${terraform.env}-vpc"
        "Application" = "${terraform.env}-vpc"
        "Network" = "Public"
    }

    provider = "aws.cloud-billing"
}

output "vpc.id" {
  value = "${aws_vpc.cb-vpc.id}"
}
