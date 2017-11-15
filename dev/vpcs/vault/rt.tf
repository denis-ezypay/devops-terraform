variable "mgmt_to_vault_peering" {}

resource "aws_route_table" "RTB-Private-A" {
    vpc_id = "${aws_vpc.vault-vpc.id}"

    tags {
        "Network" = "Private"
        "Application" = "${terraform.env}-vault-vpc"
        "Name" = "${terraform.env}-RTB-Private-A"
    }
}

resource "aws_route" "internal-private-a" {
    route_table_id         = "${aws_route_table.RTB-Private-A.id}"
    destination_cidr_block = "10.52.0.0/16"
    vpc_peering_connection_id = "${var.mgmt_to_vault_peering}"
}

resource "aws_route" "nat-gateway-private-a-fixed" {
    route_table_id         = "${aws_route_table.RTB-Private-A.id}"
    destination_cidr_block = "0.0.0.0/0"
    network_interface_id   = "${lookup(var.nat-network-interfaces, format("%s-%s", terraform.env, "private-a"))}"
    count                  = "${terraform.env == "sandbox" || terraform.env == "dev1" ? 0 : 1}"
}

resource "aws_route" "nat-gateway-private-a" {
    route_table_id         = "${aws_route_table.RTB-Private-A.id}"
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id         = "${module.nat_gateway.id}"
    count                  = "${terraform.env == "sandbox" || terraform.env == "dev1" ? 1 : 0}"
}

resource "aws_route_table" "RTB-Private-B" {
    vpc_id = "${aws_vpc.vault-vpc.id}"

    route {
        cidr_block = "10.52.0.0/16"
        vpc_peering_connection_id = "${var.mgmt_to_vault_peering}"
    }

    tags {
        "Application" = "${terraform.env}-vault-vpc"
        "Name" = "${terraform.env}-RTB-Private-B"
        "Network" = "Private"
    }
}

resource "aws_route_table" "RTB-Private-C" {
    vpc_id = "${aws_vpc.vault-vpc.id}"
    count  = "${var.number_of_az >= 3 ? 1 : 0}"

    route {
        cidr_block = "10.52.0.0/16"
        vpc_peering_connection_id = "${var.mgmt_to_vault_peering}"
    }

    tags {
        "Network" = "Private"
        "Name" = "${terraform.env}-RTB-Private-C"
        "Application" = "${terraform.env}-vault-vpc"
    }
}

resource "aws_route_table" "RTB-Public" {
    vpc_id = "${aws_vpc.vault-vpc.id}"

    route {
        cidr_block = "10.52.0.0/16"
        vpc_peering_connection_id = "${var.mgmt_to_vault_peering}"
    }

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.InternetGateway.id}"
    }

    tags {
        "Name" = "${terraform.env}-RTB-Public"
        "Application" = "${terraform.env}-vault-vpc"
        "Network" = "Public"
    }
}
