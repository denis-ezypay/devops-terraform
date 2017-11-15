# pcx-be9320d7
resource "aws_vpc_peering_connection" "mgmt-to-cloudbilling" {
  peer_owner_id = "${lookup(var.cb_account_ids, terraform.env)}"
  vpc_id        = "${module.mgmt.vpc.id}"
  peer_vpc_id   = "${module.cloud-billing.vpc.id}"
  auto_accept   = true

  tags {
    Name = "${terraform.env}-mgmt-to-cloudbilling"
  }
}

# pcx-2f6ddd46
resource "aws_vpc_peering_connection" "mgmt-to-vault" {
  peer_owner_id = "${lookup(var.vault_account_ids, terraform.env)}"
  vpc_id        = "${module.mgmt.vpc.id}"
  peer_vpc_id   = "${module.vault.vpc.id}"
  auto_accept   = true

  tags {
    Name = "${terraform.env}-mgmt-to-vault"
  }
}

# pcx-6ce35d05
resource "aws_vpc_peering_connection" "mgmt-to-IAM" {
  peer_owner_id = "${lookup(var.vault_account_ids, terraform.env)}"
  vpc_id        = "${module.mgmt.vpc.id}"
  peer_vpc_id   = "${module.iam.vpc.id}"
  auto_accept   = true

  tags {
    Name = "${terraform.env}-mgmt-to-IAM"
  }
}
