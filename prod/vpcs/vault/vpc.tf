resource "aws_vpc" "vault-vpc" {
    cidr_block           = "10.51.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags {
        "Name" = "${terraform.env}-vault-vpc"
        "Network" = "Public"
        "Application" = "${terraform.env}-vault-vpc"
    }
}

output "vpc.id" {
  value = "${aws_vpc.vault-vpc.id}"
}
