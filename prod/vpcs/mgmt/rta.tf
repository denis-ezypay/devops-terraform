resource "aws_route_table_association" "mgmt-RTB-private-rtbassoc-10949874" {
    route_table_id = "${aws_route_table.mgmt-RTB-private.id}"
    subnet_id = "${aws_subnet.subnet-mgmt-private.id}"
}

resource "aws_route_table_association" "mgmt-RTB-public-rtbassoc-6f94980b" {
    route_table_id = "${aws_route_table.mgmt-RTB-public.id}"
    subnet_id = "${aws_subnet.subnet-mgmt-public.id}"
}
