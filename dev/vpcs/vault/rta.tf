resource "aws_route_table_association" "RTB-Private-A-rtbassoc-f14e4195" {
    route_table_id = "${aws_route_table.RTB-Private-A.id}"
    subnet_id = "${aws_subnet.subnet-vault-Private-A1.id}"
}

resource "aws_route_table_association" "RTB-Public-rtbassoc-fe4e419a" {
    route_table_id = "${aws_route_table.RTB-Public.id}"
    subnet_id = "${aws_subnet.subnet-vault-Public-A1.id}"
}

resource "aws_route_table_association" "RTB-Private-A-rtbassoc-fd4e4199" {
    route_table_id = "${aws_route_table.RTB-Private-A.id}"
    subnet_id = "${aws_subnet.subnet-vault-Private-A2.id}"
}

resource "aws_route_table_association" "RTB-Private-B-rtbassoc-ff4e419b" {
    route_table_id = "${aws_route_table.RTB-Private-B.id}"
    subnet_id = "${aws_subnet.subnet-vault-Private-B1.id}"
}

resource "aws_route_table_association" "RTB-Public-rtbassoc-f74e4193" {
    route_table_id = "${aws_route_table.RTB-Public.id}"
    subnet_id = "${aws_subnet.subnet-vault-Public-B1.id}"
}

resource "aws_route_table_association" "RTB-Private-B-rtbassoc-f34e4197" {
    route_table_id = "${aws_route_table.RTB-Private-B.id}"
    subnet_id = "${aws_subnet.subnet-vault-Private-B2.id}"
}

resource "aws_route_table_association" "RTB-Private-C-rtbassoc-f24e4196" {
    route_table_id = "${aws_route_table.RTB-Private-C.id}"
    subnet_id = "${aws_subnet.subnet-vault-Private-C1.id}"
    count  = "${var.number_of_az >= 3 ? 1 : 0}"
}

resource "aws_route_table_association" "RTB-Public-rtbassoc-fc4e4198" {
    route_table_id = "${aws_route_table.RTB-Public.id}"
    subnet_id = "${aws_subnet.subnet-vault-Public-C1.id}"
    count  = "${var.number_of_az >= 3 ? 1 : 0}"
}

resource "aws_route_table_association" "RTB-Private-C-rtbassoc-f04e4194" {
    route_table_id = "${aws_route_table.RTB-Private-C.id}"
    subnet_id = "${aws_subnet.subnet-vault-Private-C2.id}"
    count  = "${var.number_of_az >= 3 ? 1 : 0}"
}
