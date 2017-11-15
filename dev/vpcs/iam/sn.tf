data "aws_availability_zones" "available" {}

resource "aws_subnet" "subnet-iam-private-A1" {
    vpc_id = "${aws_vpc.IAM-vpc.id}"
    cidr_block              = "10.53.10.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[0]}"
    map_public_ip_on_launch = false

    tags {
        "Name" = "${terraform.env}-IAM-subnet-private-A1"
        "Tier" = "Private"
        "Block" = "1"
    }
}

resource "aws_subnet" "subnet-iam-public-A1" {
    vpc_id = "${aws_vpc.IAM-vpc.id}"
    cidr_block              = "10.53.1.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[0]}"
    map_public_ip_on_launch = false

    tags {
        "Name" = "${terraform.env}-IAM-subnet-public-A1"
        "Tier" = "Public"
        "Block" = "1"
    }
}

resource "aws_subnet" "subnet-iam-private-A2" {
    vpc_id = "${aws_vpc.IAM-vpc.id}"
    cidr_block              = "10.53.11.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[0]}"
    map_public_ip_on_launch = false

    tags {
        "Name" = "${terraform.env}-IAM-subnet-private-A2"
        "Tier" = "Private"
        "Block" = "2"
    }
}

resource "aws_subnet" "subnet-iam-public-B1" {
    vpc_id = "${aws_vpc.IAM-vpc.id}"
    cidr_block              = "10.53.2.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[1]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 2 ? 1 : 0}"

    tags {
        "Name" = "${terraform.env}-IAM-subnet-public-B1"
        "Tier" = "Public"
        "Block" = "1"
    }
}

resource "aws_subnet" "subnet-iam-private-B1" {
    vpc_id = "${aws_vpc.IAM-vpc.id}"
    cidr_block              = "10.53.20.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[1]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 2 ? 1 : 0}"

    tags {
        "Name" = "${terraform.env}-IAM-subnet-private-B1"
        "Tier" = "Private"
        "Block" = "1"
    }
}

resource "aws_subnet" "subnet-iam-private-B2" {
    vpc_id = "${aws_vpc.IAM-vpc.id}"
    cidr_block              = "10.53.21.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[1]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 2 ? 1 : 0}"

    tags {
        "Name" = "${terraform.env}-IAM-subnet-private-B2"
        "Tier" = "Private"
        "Block" = "2"
    }
}

resource "aws_subnet" "subnet-iam-public-C1" {
    vpc_id = "${aws_vpc.IAM-vpc.id}"
    cidr_block              = "10.53.3.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[2]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 3 ? 1 : 0}"

    tags {
        "Name" = "${terraform.env}-IAM-subnet-public-C1"
        "Tier" = "Public"
        "Block" = "1"
    }
}

resource "aws_subnet" "subnet-iam-private-C1" {
    vpc_id = "${aws_vpc.IAM-vpc.id}"
    cidr_block              = "10.53.30.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[2]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 3 ? 1 : 0}"

    tags {
        "Name" = "${terraform.env}-IAM-subnet-private-C1"
        "Tier" = "Private"
        "Block" = "1"
    }
}

resource "aws_subnet" "subnet-iam-private-C2" {
    vpc_id = "${aws_vpc.IAM-vpc.id}"
    cidr_block              = "10.53.31.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[2]}"
    map_public_ip_on_launch = false
    count                   = "${var.number_of_az >= 3 ? 1 : 0}"

    tags {
        "Name" = "${terraform.env}-IAM-subnet-private-C2"
        "Tier" = "Private"
        "Block" = "2"
    }
}
