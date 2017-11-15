variable "mgmt_to_cb_peering" {}

resource "aws_route_table" "cb-RTB-Private-A" {
    vpc_id = "${aws_vpc.cb-vpc.id}"

    route {
        cidr_block = "10.52.0.0/16"
        vpc_peering_connection_id = "${var.mgmt_to_cb_peering}"
    }

    tags {
        "Name" = "${terraform.env}-cb-RTB-Private-A"
        "Network" = "Private"
        "Application" = "${terraform.env}-vpc"
    }

    provider = "aws.cloud-billing"
}

resource "aws_route" "nat-gateway-private-fixed-a" {
    route_table_id         = "${aws_route_table.cb-RTB-Private-A.id}"
    destination_cidr_block = "0.0.0.0/0"
    network_interface_id   = "${lookup(var.nat-network-interfaces, format("%s-%s", terraform.env, "private-a"))}"
    count                  = "${terraform.env == "sandbox" || terraform.env == "dev1" ? 0 : 1}"
}

resource "aws_route" "nat-gateway-private-a" {
    route_table_id         = "${aws_route_table.cb-RTB-Private-A.id}"
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id         = "${module.nat_gateway_a.id}"
    count                  = "${terraform.env == "sandbox" || terraform.env == "dev1" ? 1 : 0}"
}

resource "aws_route_table" "cb-RTB-Private-B" {
    vpc_id = "${aws_vpc.cb-vpc.id}"

    route {
        cidr_block = "10.52.0.0/16"
        vpc_peering_connection_id = "${var.mgmt_to_cb_peering}"
    }

    tags {
        "Name" = "${terraform.env}-cb-RTB-Private-B"
        "Network" = "Private"
        "Application" = "${terraform.env}-vpc"
    }

    provider = "aws.cloud-billing"
}

resource "aws_route" "nat-gateway-private-fixed-b" {
    route_table_id         = "${aws_route_table.cb-RTB-Private-B.id}"
    destination_cidr_block = "0.0.0.0/0"
    network_interface_id   = "${lookup(var.nat-network-interfaces, format("%s-%s", terraform.env, "private-b"))}"
    count                  = "${terraform.env == "sandbox" || terraform.env == "dev1" ? 0 : 1}"
}

resource "aws_route" "nat-gateway-private-b" {
    route_table_id         = "${aws_route_table.cb-RTB-Private-B.id}"
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id         = "${module.nat_gateway_b.id}"
    count                  = "${terraform.env == "sandbox" || terraform.env == "dev1" ? 1 : 0}"
}

resource "aws_route_table" "cb-RTB-Private-C" {
    vpc_id = "${aws_vpc.cb-vpc.id}"
    count  = "${var.number_of_az >= 3 ? 1 : 0}"

    route {
        cidr_block = "10.52.0.0/16"
        vpc_peering_connection_id = "${var.mgmt_to_cb_peering}"
    }

    tags {
        "Name" = "${terraform.env}-cb-RTB-Private-C"
        "Application" = "${terraform.env}-vpc"
        "Network" = "Private"
    }

    provider = "aws.cloud-billing"
}

resource "aws_route" "nat-gateway-private-fixed-c" {
    route_table_id         = "${aws_route_table.cb-RTB-Private-C.id}"
    destination_cidr_block = "0.0.0.0/0"
    network_interface_id   = "${lookup(var.nat-network-interfaces, format("%s-%s", terraform.env, "private-c"))}"
    count                  = "${terraform.env == "sandbox" || terraform.env == "dev1" ? 0 : 1}"
}

resource "aws_route" "nat-gateway-private-c" {
    route_table_id         = "${aws_route_table.cb-RTB-Private-C.id}"
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id         = "${module.nat_gateway_c.id}"
    count                  = "${terraform.env == "sandbox" ? 1 : 0}"
}

resource "aws_route_table" "cb-RTB-Public" {
    vpc_id = "${aws_vpc.cb-vpc.id}"

    route {
        cidr_block = "10.52.0.0/16"
        vpc_peering_connection_id = "${var.mgmt_to_cb_peering}"
    }

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.cb-InternetGateway.id}"
    }

    tags {
        "Network" = "Public"
        "Application" = "${terraform.env}-vpc"
        "Name" = "${terraform.env}-cb-RTB-Public"
    }

    provider = "aws.cloud-billing"
}
