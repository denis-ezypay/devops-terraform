variable "vault_profile" {
  type = "map"

  default = {
    dev1    = "stage"
    sandbox = "stage"
    staging = "stage"
    sydney  = "ezypay_sydney_vault_mfa"
  }
}

variable "cb_profile" {
  type = "map"

  default = {
    dev1    = "stage"
    sandbox = "stage"
    staging = "stage"
    sydney  = "sydneycb"
  }
}

variable "region" {
  type = "map"

  default = {
    dev1    = "ap-southeast-1"
    sandbox = "ap-southeast-2"
    staging = "ap-southeast-2"
    sydney  = "ap-southeast-2"
  }
}

provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "${lookup(var.vault_profile, terraform.env)}"
  region                  = "${lookup(var.region, terraform.env)}"
}

provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "${lookup(var.cb_profile, terraform.env)}"
  region                  = "${lookup(var.region, terraform.env)}"
  alias                   = "cloud-billing"
}
