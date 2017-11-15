resource "aws_vpc" "mgmt-vpc" {
    cidr_block           = "10.52.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags {
        "Name" = "${terraform.env}-mgmt-vpc"
    }
}

output "vpc.id" {
  value = "${aws_vpc.mgmt-vpc.id}"
}
