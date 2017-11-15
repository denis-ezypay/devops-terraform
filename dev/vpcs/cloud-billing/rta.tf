resource "aws_route_table_association" "RTB-Private-A-rtbassoc-5f414a3b" {
    route_table_id = "${aws_route_table.cb-RTB-Private-A.id}"
    subnet_id = "${aws_subnet.subnet-cb-Subnet-Private-A2.id}"
    provider = "aws.cloud-billing"
}

resource "aws_route_table_association" "RTB-Private-A-rtbassoc-5a414a3e" {
    route_table_id = "${aws_route_table.cb-RTB-Private-A.id}"
    subnet_id = "${aws_subnet.subnet-cb-Subnet-Private-A1.id}"
    provider = "aws.cloud-billing"
}

resource "aws_route_table_association" "RTB-Private-C-rtbassoc-5e414a3a" {
    route_table_id = "${aws_route_table.cb-RTB-Private-C.id}"
    subnet_id = "${aws_subnet.subnet-cb-Subnet-Private-C1.id}"
    count  = "${var.number_of_az >= 3 ? 1 : 0}"
    provider = "aws.cloud-billing"
}

resource "aws_route_table_association" "RTB-Private-C-rtbassoc-5d414a39" {
    route_table_id = "${aws_route_table.cb-RTB-Private-C.id}"
    subnet_id = "${aws_subnet.subnet-cb-Subnet-Private-C2.id}"
    count  = "${var.number_of_az >= 3 ? 1 : 0}"
    provider = "aws.cloud-billing"
}

resource "aws_route_table_association" "RTB-Public-rtbassoc-59414a3d" {
    route_table_id = "${aws_route_table.cb-RTB-Public.id}"
    subnet_id = "${aws_subnet.subnet-cb-Subnet-Public-B1.id}"
    provider = "aws.cloud-billing"
}

resource "aws_route_table_association" "RTB-Public-rtbassoc-58414a3c" {
    route_table_id = "${aws_route_table.cb-RTB-Public.id}"
    subnet_id = "${aws_subnet.subnet-cb-Subnet-Public-A1.id}"
    provider = "aws.cloud-billing"
}

resource "aws_route_table_association" "RTB-Public-rtbassoc-26414a42" {
    route_table_id = "${aws_route_table.cb-RTB-Public.id}"
    subnet_id = "${aws_subnet.subnet-cb-Subnet-Public-C1.id}"
    count  = "${var.number_of_az >= 3 ? 1 : 0}"
    provider = "aws.cloud-billing"
}

resource "aws_route_table_association" "RTB-Private-B-rtbassoc-24414a40" {
    route_table_id = "${aws_route_table.cb-RTB-Private-B.id}"
    subnet_id = "${aws_subnet.subnet-cb-Subnet-Private-B2.id}"
    provider = "aws.cloud-billing"
}

resource "aws_route_table_association" "RTB-Private-B-rtbassoc-5b414a3f" {
    route_table_id = "${aws_route_table.cb-RTB-Private-B.id}"
    subnet_id = "${aws_subnet.subnet-cb-Subnet-Private-B1.id}"
    provider = "aws.cloud-billing"
}
