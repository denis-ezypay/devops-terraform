variable "subnet_id" {}
variable "enable" {
  type = "string"
  default = "true"
}

output "id" {
    value = "${aws_nat_gateway.gw.id}"
}

resource "aws_eip" "gw" {
  vpc = true
  count = "${(terraform.env == "sandbox" || terraform.env == "dev1") && var.enable == "true" ? 1 : 0}"
}

resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.gw.id}"
  subnet_id     = "${var.subnet_id}"
  count         = "${(terraform.env == "sandbox" || terraform.env == "dev1") && var.enable == "true" ? 1 : 0}"
}
