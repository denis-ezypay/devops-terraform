resource "aws_s3_bucket" "ezypay" {
    bucket = "ezypay-${terraform.env}"
    acl    = "private"
}

resource "aws_s3_bucket" "ezypay-logs" {
    bucket = "ezypay-${terraform.env}-logs"
    acl    = "log-delivery-write"
    policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "AWSConsole-AccessLogs-Policy-1484894390870",
  "Statement": [
    {
      "Sid": "AWSConsoleStmt-1484894390870",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${lookup(var.aws-elb-service-account, lookup(var.region, terraform.env))}:root"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::ezypay-${terraform.env}-logs/AWSLogs/${lookup(var.vault_account_ids, terraform.env)}/*"
    },
    {
      "Sid": "AWSCloudTrailAclCheck20150319",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "s3:GetBucketAcl",
      "Resource": "arn:aws:s3:::ezypay-${terraform.env}-logs"
    },
    {
      "Sid": "AWSCloudTrailWrite20150319",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::ezypay-${terraform.env}-logs/AWSLogs/${lookup(var.vault_account_ids, terraform.env)}/*",
      "Condition": {
        "StringEquals": {
          "s3:x-amz-acl": "bucket-owner-full-control"
        }
      }
    }
  ]
}
POLICY
}

resource "aws_s3_bucket" "ezypay-logs-s3" {
    bucket = "ezypay-${terraform.env}-logs-s3"
    acl    = "private"
}

resource "aws_s3_bucket" "ezypay-vault" {
    bucket = "ezypay-vault-${terraform.env}"
    acl    = "private"
}

resource "aws_s3_bucket" "ezypaybill" {
    bucket   = "ezypaybill-${terraform.env}"
    acl      = "private"
    provider = "aws.cloud-billing"
}


resource "aws_s3_bucket" "ezypaybill-logs" {
    bucket   = "ezypaybill-${terraform.env}-logs"
    acl      = "log-delivery-write"
    provider = "aws.cloud-billing"
    policy   = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "AWSConsole-AccessLogs-Policy-1494389513433",
  "Statement": [
    {
      "Sid": "AWSConsoleStmt-1494389513433",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${lookup(var.aws-elb-service-account, lookup(var.region, terraform.env))}:root"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::ezypaybill-${terraform.env}-logs/AWSLogs/${lookup(var.cb_account_ids, terraform.env)}/*"
    }
  ]
}
POLICY
}

resource "aws_s3_bucket" "ezypaybill-upload" {
    bucket   = "ezypaybill-upload-${terraform.env}"
    acl      = "private"
    provider = "aws.cloud-billing"
}
