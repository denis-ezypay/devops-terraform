module "nat_gateway_a" {
  source          = "../../modules/nat_gateway"
  subnet_id       = "${aws_subnet.subnet-iam-public-A1.id}"
}

module "nat_gateway_b" {
  source          = "../../modules/nat_gateway"
  subnet_id       = "${aws_subnet.subnet-iam-public-B1.id}"
}

module "nat_gateway_c" {
  source          = "../../modules/nat_gateway"
  subnet_id       = "${var.number_of_az >= 3 ? join(" ", aws_subnet.subnet-iam-public-C1.*.id) : ""}"
  enable          = "${var.number_of_az >= 3 ? "true" : "false"}"
}
