module "nat_gateway_a" {
  source          = "../../modules/nat_gateway"
  subnet_id       = "${aws_subnet.subnet-cb-Subnet-Public-A1.id}"
}

module "nat_gateway_b" {
  source          = "../../modules/nat_gateway"
  subnet_id       = "${aws_subnet.subnet-cb-Subnet-Public-B1.id}"
}

module "nat_gateway_c" {
  source          = "../../modules/nat_gateway"
  subnet_id       = "${var.number_of_az >= 3 ? join(" ", aws_subnet.subnet-cb-Subnet-Public-C1.*.id) : ""}"
  enable          = "${var.number_of_az >= 3 ? "true" : "false"}"
}
