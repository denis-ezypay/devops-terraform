variable "mgmt_to_iam_peering" {}

resource "aws_route_table" "IAM-RTB-private-A" {
    vpc_id = "${aws_vpc.IAM-vpc.id}"

    tags {
        "Name" = "${terraform.env}-IAM-RTB-private-A"
    }
}

resource "aws_route" "nat-gateway-private-peering-a" {
    route_table_id            = "${aws_route_table.IAM-RTB-private-A.id}"
    destination_cidr_block    = "10.52.0.0/16"
    vpc_peering_connection_id = "${var.mgmt_to_iam_peering}"
}

resource "aws_route" "nat-gateway-private-fixed-a" {
    route_table_id         = "${aws_route_table.IAM-RTB-private-A.id}"
    destination_cidr_block = "0.0.0.0/0"
    network_interface_id   = "${lookup(var.nat-network-interfaces, format("%s-%s", terraform.env, "private-a"))}"
    count                  = "${terraform.env == "sandbox" || terraform.env == "dev1" ? 0 : 1}"
}

resource "aws_route" "nat-gateway-private-a" {
    route_table_id         = "${aws_route_table.IAM-RTB-private-A.id}"
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id         = "${module.nat_gateway_a.id}"
    count                  = "${terraform.env == "sandbox" || terraform.env == "dev1" ? 1 : 0}"
}

resource "aws_route_table" "IAM-RTB-private-B" {
    vpc_id = "${aws_vpc.IAM-vpc.id}"

    tags {
        "Name" = "${terraform.env}-IAM-RTB-private-B"
    }
}

resource "aws_route" "nat-gateway-private-peering-b" {
    route_table_id            = "${aws_route_table.IAM-RTB-private-B.id}"
    destination_cidr_block    = "10.52.0.0/16"
    vpc_peering_connection_id = "${var.mgmt_to_iam_peering}"
}

resource "aws_route" "nat-gateway-private-fixed-b" {
    route_table_id         = "${aws_route_table.IAM-RTB-private-B.id}"
    destination_cidr_block = "0.0.0.0/0"
    network_interface_id   = "${lookup(var.nat-network-interfaces, format("%s-%s", terraform.env, "private-b"))}"
    count                  = "${terraform.env == "sandbox" || terraform.env == "dev1" ? 0 : 1}"
}

resource "aws_route" "nat-gateway-private-b" {
    route_table_id         = "${aws_route_table.IAM-RTB-private-B.id}"
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id         = "${module.nat_gateway_b.id}"
    count                  = "${terraform.env == "sandbox" || terraform.env == "dev1" ? 1 : 0}"
}

resource "aws_route_table" "IAM-RTB-private-C" {
    vpc_id = "${aws_vpc.IAM-vpc.id}"
    count  = "${var.number_of_az >= 3 ? 1 : 0}"

    tags {
        "Name" = "${terraform.env}-IAM-RTB-private-C"
    }
}

resource "aws_route" "nat-gateway-private-peering-c" {
    route_table_id            = "${aws_route_table.IAM-RTB-private-C.id}"
    destination_cidr_block    = "10.52.0.0/16"
    vpc_peering_connection_id = "${var.mgmt_to_iam_peering}"
    count                     = "${terraform.env == "sandbox" ? 1 : 0}"
}

resource "aws_route" "nat-gateway-private-fixed-c" {
    route_table_id         = "${aws_route_table.IAM-RTB-private-C.id}"
    destination_cidr_block = "0.0.0.0/0"
    network_interface_id   = "${lookup(var.nat-network-interfaces, format("%s-%s", terraform.env, "private-c"))}"
    count                  = "${terraform.env == "sandbox" || terraform.env == "dev1" ? 0 : 1}"
}

resource "aws_route" "nat-gateway-private-c" {
    route_table_id         = "${aws_route_table.IAM-RTB-private-C.id}"
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id         = "${module.nat_gateway_c.id}"
    count                  = "${terraform.env == "sandbox" ? 1 : 0}"
}

resource "aws_route_table" "IAM-RTB-public" {
    vpc_id = "${aws_vpc.IAM-vpc.id}"

    route {
        cidr_block = "10.52.0.0/16"
        vpc_peering_connection_id = "${var.mgmt_to_iam_peering}"
    }

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.IAM-InternetGateway.id}"
    }

    tags {
        "Name" = "${terraform.env}-IAM-RTB-public"
    }
}
