resource "aws_route_table_association" "IAM-RTB-private-A-rtbassoc-caad7fad" {
    route_table_id = "${aws_route_table.IAM-RTB-private-A.id}"
    subnet_id = "${aws_subnet.subnet-iam-private-A1.id}"
}

resource "aws_route_table_association" "IAM-RTB-public-rtbassoc-8aa87aed" {
    route_table_id = "${aws_route_table.IAM-RTB-public.id}"
    subnet_id = "${aws_subnet.subnet-iam-public-A1.id}"
}

resource "aws_route_table_association" "IAM-RTB-private-A-rtbassoc-c7bb67a0" {
    route_table_id = "${aws_route_table.IAM-RTB-private-A.id}"
    subnet_id = "${aws_subnet.subnet-iam-private-A2.id}"
}

resource "aws_route_table_association" "IAM-RTB-private-B-rtbassoc-d6b864b1" {
    route_table_id = "${aws_route_table.IAM-RTB-private-B.id}"
    subnet_id = "${aws_subnet.subnet-iam-private-B1.id}"
}

resource "aws_route_table_association" "IAM-RTB-private-B-rtbassoc-bab66add" {
    route_table_id = "${aws_route_table.IAM-RTB-private-B.id}"
    subnet_id = "${aws_subnet.subnet-iam-private-B2.id}"
}

resource "aws_route_table_association" "IAM-RTB-public-rtbassoc-47ba6620" {
    route_table_id = "${aws_route_table.IAM-RTB-public.id}"
    subnet_id = "${aws_subnet.subnet-iam-public-B1.id}"
}

resource "aws_route_table_association" "IAM-RTB-private-C-rtbassoc-0fb06c68" {
    route_table_id = "${aws_route_table.IAM-RTB-private-C.id}"
    subnet_id = "${aws_subnet.subnet-iam-private-C1.id}"
    count  = "${var.number_of_az >= 3 ? 1 : 0}"
}

resource "aws_route_table_association" "IAM-RTB-public-rtbassoc-5db5693a" {
    route_table_id = "${aws_route_table.IAM-RTB-public.id}"
    subnet_id = "${aws_subnet.subnet-iam-public-C1.id}"
    count  = "${var.number_of_az >= 3 ? 1 : 0}"
}

resource "aws_route_table_association" "IAM-RTB-private-C-rtbassoc-e9b66a8e" {
    route_table_id = "${aws_route_table.IAM-RTB-private-C.id}"
    subnet_id = "${aws_subnet.subnet-iam-private-C2.id}"
    count  = "${var.number_of_az >= 3 ? 1 : 0}"
}

