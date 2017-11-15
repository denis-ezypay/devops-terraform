data "aws_availability_zones" "available" {}

resource "aws_subnet" "subnet-cb-Subnet-Private-A1" {
    vpc_id = "${aws_vpc.cb-vpc.id}"
    cidr_block              = "10.50.10.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[0]}"
    map_public_ip_on_launch = false

    tags {
        "Network" = "PrivateA1"
        "Tier" = "Private"
        "Application" = "${terraform.env}-vpc"
        "Name" = "${terraform.env}-Subnet-Private-A1"
        "Block" = "1"
    }

    provider = "aws.cloud-billing"
}

resource "aws_subnet" "subnet-cb-Subnet-Public-A1" {
    vpc_id = "${aws_vpc.cb-vpc.id}"
    cidr_block              = "10.50.1.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[0]}"
    map_public_ip_on_launch = false

    tags {
        "Name" = "${terraform.env}-Subnet-Public-A1"
        "Network" = "Public"
        "Tier" = "Public"
        "Application" = "${terraform.env}-vpc"
        "Block" = "1"
    }

    provider = "aws.cloud-billing"
}

resource "aws_subnet" "subnet-cb-Subnet-Private-A2" {
    vpc_id = "${aws_vpc.cb-vpc.id}"
    cidr_block              = "10.50.11.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[0]}"
    map_public_ip_on_launch = false

    tags {
        "Name" = "${terraform.env}-Subnet-Private-A2"
        "Application" = "${terraform.env}-vpc"
        "Network" = "PrivateA2"
        "Tier" = "Private"
        "Block" = "2"
    }

    provider = "aws.cloud-billing"
}

resource "aws_subnet" "subnet-cb-Subnet-Private-B1" {
    vpc_id = "${aws_vpc.cb-vpc.id}"
    cidr_block              = "10.50.20.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[1]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 2 ? 1 : 0}"

    tags {
        "Application" = "${terraform.env}-vpc"
        "Name" = "${terraform.env}-Subnet-Private-B1"
        "Network" = "PrivateB1"
        "Tier" = "Private"
        "Block" = "1"
    }

    provider = "aws.cloud-billing"
}

resource "aws_subnet" "subnet-cb-Subnet-Public-B1" {
    vpc_id = "${aws_vpc.cb-vpc.id}"
    cidr_block              = "10.50.2.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[1]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 2 ? 1 : 0}"

    tags {
        "Application" = "${terraform.env}-vpc"
        "Name" = "${terraform.env}-Subnet-Public-B1"
        "Network" = "Public"
        "Tier" = "Public"
        "Block" = "1"
    }

    provider = "aws.cloud-billing"
}

resource "aws_subnet" "subnet-cb-Subnet-Private-B2" {
    vpc_id = "${aws_vpc.cb-vpc.id}"
    cidr_block              = "10.50.21.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[1]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 2 ? 1 : 0}"

    tags {
        "Network" = "PrivateB2"
        "Tier" = "Private"
        "Name" = "${terraform.env}-Subnet-Private-B2"
        "Application" = "${terraform.env}-vpc"
        "Block" = "2"
    }

    provider = "aws.cloud-billing"
}

resource "aws_subnet" "subnet-cb-Subnet-Public-C1" {
    vpc_id = "${aws_vpc.cb-vpc.id}"
    cidr_block              = "10.50.3.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[2]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 3 ? 1 : 0}"

    tags {
        "Application" = "${terraform.env}-vpc"
        "Name" = "${terraform.env}-Subnet-Public-C1"
        "Network" = "Public"
        "Tier" = "Public"
        "Block" = "1"
    }

    provider = "aws.cloud-billing"
}

resource "aws_subnet" "subnet-cb-Subnet-Private-C1" {
    vpc_id = "${aws_vpc.cb-vpc.id}"
    cidr_block              = "10.50.30.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[2]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 3 ? 1 : 0}"

    tags {
        "Name" = "${terraform.env}-Subnet-Private-C1"
        "Application" = "${terraform.env}-vpc"
        "Network" = "PrivateC1"
        "Tier" = "Private"
        "Block" = "1"
    }

    provider = "aws.cloud-billing"
}

resource "aws_subnet" "subnet-cb-Subnet-Private-C2" {
    vpc_id = "${aws_vpc.cb-vpc.id}"
    cidr_block              = "10.50.31.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[2]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 3 ? 1 : 0}"

    tags {
        "Network" = "PrivateC2"
        "Tier" = "Private"
        "Name" = "${terraform.env}-Subnet-Private-C2"
        "Application" = "${terraform.env}-vpc"
        "Block" = "2"
    }

    provider = "aws.cloud-billing"
}
