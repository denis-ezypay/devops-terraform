module "nat_gateway" {
  source          = "../../modules/nat_gateway"
  subnet_id       = "${aws_subnet.subnet-vault-Public-A1.id}"
}
