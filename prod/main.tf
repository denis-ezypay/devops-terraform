data "aws_availability_zones" "available" {}

variable "vault_account_ids" {
  type = "map"

  default = {
    dev1    = "199241324492"
    sandbox = "199241324492"
    staging = "199241324492"
    sydney  = "052346959408"
  }
}

variable "cb_account_ids" {
  type = "map"

  default = {
    dev1    = "199241324492"
    sandbox = "199241324492"
    staging = "199241324492"
    sydney  = "413438936010"
  }
}

variable "number_of_az" {
  type = "map"

  default = {
    ap-southeast-1 = "2"
    ap-southeast-2 = "3"
  }
}

# This is used for setting the account which writes the logs for classic ELBs (single account per region).
# See http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-access-logs.html for a full list
variable "aws-elb-service-account" {
  type = "map"

  default = {
    ap-southeast-1 = "114774131450"
    ap-southeast-2 = "783225319266"
  }
}

variable "prefix-list-ids" {
  type = "map"

  default = {
    ap-southeast-1 = "pl-6fa54006"
    ap-southeast-2 = "pl-6ca54005"
  }
}

module "cloud-billing" {
  source     = "./vpcs/cloud-billing"

  account_id = "${lookup(var.cb_account_ids, terraform.env)}"
  logging-bucket = "${aws_s3_bucket.ezypaybill-logs.id}"
  mgmt_to_cb_peering = "${aws_vpc_peering_connection.mgmt-to-cloudbilling.id}"
  mgmt-deploy-sg = "${module.mgmt.deploy-sg}"
  mgmt-bastion-sg = "${module.mgmt.bastion-sg}"
  mgmt-kibana-sg = "${module.mgmt.kibana-sg}"
  mgmt-ldap-sg = "${module.mgmt.ldap-sg}"
  mgmt-ntp-sg = "${module.mgmt.ntp-sg}"
  mgmt-repo-sg = "${module.mgmt.repo-sg}"
  mgmt-vpn-sg = "${module.mgmt.vpn-sg}"
  number_of_az = "${lookup(var.number_of_az, lookup(var.region, terraform.env))}"
}

module "iam" {
  source     = "./vpcs/iam"

  account_id = "${lookup(var.vault_account_ids, terraform.env)}"
  logging-bucket = "${aws_s3_bucket.ezypay-logs.id}"
  mgmt_to_iam_peering = "${aws_vpc_peering_connection.mgmt-to-IAM.id}"
  mgmt-deploy-sg = "${module.mgmt.deploy-sg}"
  mgmt-ossec-sg = "${module.mgmt.ossec-sg}"
  mgmt-bastion-sg = "${module.mgmt.bastion-sg}"
  mgmt-kibana-sg = "${module.mgmt.kibana-sg}"
  mgmt-ldap-sg = "${module.mgmt.ldap-sg}"
  mgmt-nagios-sg = "${module.mgmt.nagios-sg}"
  mgmt-nessus-sg = "${module.mgmt.nessus-sg}"
  mgmt-ntp-sg = "${module.mgmt.ntp-sg}"
  mgmt-repo-sg = "${module.mgmt.repo-sg}"
  number_of_az = "${lookup(var.number_of_az, lookup(var.region, terraform.env))}"
  prefix-list-id = "${lookup(var.prefix-list-ids, lookup(var.region, terraform.env))}"
  region = "${lookup(var.region, terraform.env)}"
}

module "mgmt" {
  source     = "./vpcs/mgmt"

  mgmt_to_cb_peering = "${aws_vpc_peering_connection.mgmt-to-cloudbilling.id}"
  mgmt_to_iam_peering = "${aws_vpc_peering_connection.mgmt-to-IAM.id}"
  mgmt_to_vault_peering = "${aws_vpc_peering_connection.mgmt-to-vault.id}"
  cb-management-sg = "${module.cloud-billing.management-sg}"
  cb-postgres-sg = "${module.cloud-billing.postgres-sg}"
  cb-rabbitmq-sg = "${module.cloud-billing.rabbitmq-sg}"
  iam-management-sg = "${module.iam.management-sg}"
  iam-service-sg = "${module.iam.service-sg}"
  iam-web-sg = "${module.iam.web-sg}"
  vault-api-sg = "${module.vault.api-sg}"
  vault-batch-sg = "${module.vault.batch-sg}"
  vault-config-sg = "${module.vault.config-sg}"
  vault-db-sg = "${module.vault.db-sg}"
  vault-engine-sg = "${module.vault.engine-sg}"
  vault-gateway-sg = "${module.vault.gateway-sg}"
  vault-management-sg = "${module.vault.management-sg}"
  vault-ui-sg = "${module.vault.ui-sg}"
  vault-web-sg = "${module.vault.web-sg}"
  number_of_az = "${lookup(var.number_of_az, lookup(var.region, terraform.env))}"
  prefix-list-id = "${lookup(var.prefix-list-ids, lookup(var.region, terraform.env))}"
  region = "${lookup(var.region, terraform.env)}"
}

module "vault" {
  source     = "./vpcs/vault"

  account_id = "${lookup(var.vault_account_ids, terraform.env)}"
  logging-bucket = "${aws_s3_bucket.ezypay-logs.id}"
  mgmt_to_vault_peering = "${aws_vpc_peering_connection.mgmt-to-vault.id}"
  mgmt-deploy-sg = "${module.mgmt.deploy-sg}"
  mgmt-ossec-sg = "${module.mgmt.ossec-sg}"
  mgmt-bastion-sg = "${module.mgmt.bastion-sg}"
  mgmt-kibana-sg = "${module.mgmt.kibana-sg}"
  mgmt-ldap-sg = "${module.mgmt.ldap-sg}"
  mgmt-nagios-sg = "${module.mgmt.nagios-sg}"
  mgmt-nessus-sg = "${module.mgmt.nessus-sg}"
  mgmt-ntp-sg = "${module.mgmt.ntp-sg}"
  mgmt-repo-sg = "${module.mgmt.repo-sg}"
  mgmt-sftp-sg = "${module.mgmt.sftp-sg}"
  number_of_az = "${lookup(var.number_of_az, lookup(var.region, terraform.env))}"
  prefix-list-id = "${lookup(var.prefix-list-ids, lookup(var.region, terraform.env))}"
  region = "${lookup(var.region, terraform.env)}"
}
