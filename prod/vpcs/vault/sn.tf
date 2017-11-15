data "aws_availability_zones" "available" {}

resource "aws_subnet" "subnet-vault-Private-A1" {
    vpc_id = "${aws_vpc.vault-vpc.id}"
    cidr_block              = "10.51.10.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[0]}"
    map_public_ip_on_launch = false

    tags {
        "Application" = "${terraform.env}-vault-vpc"
        "Network" = "PrivateA1"
        "Tier" = "Private"
        "Name" = "${terraform.env}-Subnet-Private-A1"
        "Block" = "1"
    }
}

resource "aws_subnet" "subnet-vault-Public-A1" {
    vpc_id = "${aws_vpc.vault-vpc.id}"
    cidr_block              = "10.51.1.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[0]}"
    map_public_ip_on_launch = false

    tags {
        "Name" = "${terraform.env}-Subnet-Public-A1"
        "Application" = "${terraform.env}-vault-vpc"
        "Network" = "Public"
        "Tier" = "Public"
        "Block" = "1"
    }
}


resource "aws_subnet" "subnet-vault-Private-A2" {
    vpc_id = "${aws_vpc.vault-vpc.id}"
    cidr_block              = "10.51.11.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[0]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 2 ? 1 : 0}"

    tags {
        "Network" = "PrivateA2"
        "Tier" = "Private"
        "Application" = "${terraform.env}-vault-vpc"
        "Name" = "${terraform.env}-Subnet-Private-A2"
        "Block" = "2"
    }
}

resource "aws_subnet" "subnet-vault-Private-B1" {
    vpc_id = "${aws_vpc.vault-vpc.id}"
    cidr_block              = "10.51.20.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[1]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 2 ? 1 : 0}"

    tags {
        "Network" = "PrivateB1"
        "Tier" = "Private"
        "Name" = "${terraform.env}-Subnet-Private-B1"
        "Application" = "${terraform.env}-vault-vpc"
        "Block" = "1"
    }
}

resource "aws_subnet" "subnet-vault-Public-B1" {
    vpc_id = "${aws_vpc.vault-vpc.id}"
    cidr_block              = "10.51.2.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[1]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 2 ? 1 : 0}"

    tags {
        "Application" = "${terraform.env}-vault-vpc"
        "Network" = "Public"
        "Tier" = "Public"
        "Name" = "${terraform.env}-Subnet-Public-B1"
        "Block" = "1"
    }
}

resource "aws_subnet" "subnet-vault-Private-B2" {
    vpc_id = "${aws_vpc.vault-vpc.id}"
    cidr_block              = "10.51.21.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[1]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 2 ? 1 : 0}"

    tags {
        "Network" = "PrivateB2"
        "Tier" = "Private"
        "Name" = "${terraform.env}-Subnet-Private-B2"
        "Application" = "${terraform.env}-vault-vpc"
        "Block" = "2"
    }
}

resource "aws_subnet" "subnet-vault-Private-C1" {
    vpc_id = "${aws_vpc.vault-vpc.id}"
    cidr_block              = "10.51.30.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[2]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 3 ? 1 : 0}"

    tags {
        "Name" = "${terraform.env}-Subnet-Private-C1"
        "Application" = "${terraform.env}-vault-vpc"
        "Network" = "PrivateC1"
        "Tier" = "Private"
        "Block" = "1"
    }
}

resource "aws_subnet" "subnet-vault-Public-C1" {
    vpc_id = "${aws_vpc.vault-vpc.id}"
    cidr_block              = "10.51.3.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[2]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 3 ? 1 : 0}"

    tags {
        "Application" = "${terraform.env}-vault-vpc"
        "Network" = "Public"
        "Tier" = "Public"
        "Name" = "${terraform.env}-Subnet-Public-C1"
        "Block" = "1"
    }
}

resource "aws_subnet" "subnet-vault-Private-C2" {
    vpc_id = "${aws_vpc.vault-vpc.id}"
    cidr_block              = "10.51.31.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[2]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 3 ? 1 : 0}"

    tags {
        "Application" = "${terraform.env}-vault-vpc"
        "Name" = "${terraform.env}-Subnet-Private-C2"
        "Network" = "PrivateC2"
        "Tier" = "Private"
        "Block" = "2"
    }
}
