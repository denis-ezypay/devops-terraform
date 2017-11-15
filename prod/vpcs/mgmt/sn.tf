data "aws_availability_zones" "available" {}

resource "aws_subnet" "subnet-mgmt-public" {
    vpc_id = "${aws_vpc.mgmt-vpc.id}"
    cidr_block              = "10.52.1.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[0]}"
    map_public_ip_on_launch = false

    tags {
        "Name" = "${terraform.env}-mgmt-subnet-public"
        "Tier" = "Public"
    }
}


resource "aws_subnet" "subnet-mgmt-private" {
    vpc_id = "${aws_vpc.mgmt-vpc.id}"
    cidr_block              = "10.52.10.0/24"
    availability_zone       = "${data.aws_availability_zones.available.names[0]}"
    map_public_ip_on_launch = false

    tags {
        "Name" = "${terraform.env}-mgmt-subnet-private"
        "Tier" = "Private"
    }
}
