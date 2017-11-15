variable "mgmt_to_cb_peering" {}
variable "mgmt_to_iam_peering" {}
variable "mgmt_to_vault_peering" {}

resource "aws_route_table" "mgmt-RTB-private" {
    vpc_id = "${aws_vpc.mgmt-vpc.id}"

    tags {
        "Name" = "${terraform.env}-mgmt-RTB-private"
    }
}

resource "aws_route" "mgmt_to_cb" {
    route_table_id          = "${aws_route_table.mgmt-RTB-private.id}"
    destination_cidr_block  = "10.50.0.0/16"
    vpc_peering_connection_id = "${var.mgmt_to_cb_peering}"
}

resource "aws_route" "mgmt_to_vault" {
    route_table_id          = "${aws_route_table.mgmt-RTB-private.id}"
    destination_cidr_block  = "10.51.0.0/16"
    vpc_peering_connection_id = "${var.mgmt_to_vault_peering}"
}

resource "aws_route" "mgmt_to_iam" {
    route_table_id          = "${aws_route_table.mgmt-RTB-private.id}"
    destination_cidr_block  = "10.53.0.0/16"
    vpc_peering_connection_id = "${var.mgmt_to_iam_peering}"
}

resource "aws_route" "nat-gateway-private-fixed" {
    route_table_id         = "${aws_route_table.mgmt-RTB-private.id}"
    destination_cidr_block = "0.0.0.0/0"
    network_interface_id   = "${lookup(var.nat-network-interfaces, format("%s-%s", terraform.env, "private"))}"
    count                  = "${terraform.env == "sandbox" || terraform.env == "dev1" ? 0 : 1}"
}

resource "aws_route" "nat-gateway-private" {
    route_table_id         = "${aws_route_table.mgmt-RTB-private.id}"
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id         = "${module.nat_gateway.id}"
    count                  = "${terraform.env == "sandbox" || terraform.env == "dev1" ? 1 : 0}"
}

resource "aws_route_table" "mgmt-RTB-public" {
    vpc_id = "${aws_vpc.mgmt-vpc.id}"

    route {
        cidr_block = "10.50.0.0/16"
        vpc_peering_connection_id = "${var.mgmt_to_cb_peering}"
    }

    route {
        cidr_block = "10.51.0.0/16"
        vpc_peering_connection_id = "${var.mgmt_to_vault_peering}"
    }

    route {
        cidr_block = "10.53.0.0/16"
        vpc_peering_connection_id = "${var.mgmt_to_iam_peering}"
    }

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.mgmt-internetGateway.id}"
    }

    tags {
        "Name" = "${terraform.env}-mgmt-RTB-public"
    }
}
