module "ez-base-ecr" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ecr-ez-base"
}

module "ez-gateway" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-gateway"
}

module "ez-boot-admin" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-boot-admin"
}

module "ez-app-gateway" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-app-gateway"
}

module "ez-config" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-config"
}

module "ez-registry" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-registry"
}

module "ez-billing-api" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-billing-api"
}

module "ez-info-api" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-info-api"
}

module "ez-webhook-api" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-webhook-api"
}

module "ez-ledger-api" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-ledger-api"
}

module "ez-support-api" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-support-api"
}

module "ez-search-api" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-search-api"
}

module "ez-note-api" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-note-api"
}

module "ez-payment-api" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-payment-api"
}

module "ez-timeline-api" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-timeline-api"
}

module "ez-pricing-api" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-pricing-api"
}

module "ez-notification-api" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-notification-api"
}

module "ez-file-api" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-file-api"
}

module "ez-import-api" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-import-api"
}

module "ez-import-integration" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-import-integration"
}

module "ez-customer-ui" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-customer-ui"
}

module "ez-swagger-ui" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-swagger-ui"
}

module "ez-merchant-app" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-merchant-app"
}

module "ez-support-app" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-support-app"
}

module "ez-billing-batch" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-billing-batch"
}

module "ez-billing-batch-settlement" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-billing-batch-settlement"
}

module "ez-billing-batch-subscription-status" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-billing-batch-subscription-status"
}

module "ez-payment-batch" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-payment-batch"
}

module "ez-ledger-batch" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-ledger-batch"
}

module "ez-vault-gateway" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-vault-gateway"
}

module "ez-vault-config" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-vault-config"
}

module "ez-vault-api" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-vault-api"
}

module "ez-vault-bank-simulator" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-vault-bank-simulator"
}

module "ez-vault-batch" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-vault-batch"
}

module "ez-hosted-ui" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-hosted-ui"
}

module "ez-iam" {
  source          = "./modules/ecr"
  account_id      = "${lookup(var.vault_account_ids, terraform.env)}"
  repository_name = "ez-iam"
}
