## Defaults
terraform {
  required_version = ">= 0.15.1"
  backend "remote" {}
}

provider "aws" {
  region = var.region
}

## Create Labels
module "quickstart_sns_label" {
  source    = "aws-quickstart/label/aws"
  version   = "0.0.2"
  region    = var.region
  namespace = var.namespace
  env       = var.environment
  account   = var.account
  name      = var.project_name
  delimiter = var.delimiter
  tags = tomap({
    "deployed_by" = "quickstart-terraform"
    "project"     = var.project_name
  })
}

## Create SNS
module "qs_sns" {
  source            = "../"
  topic_name        = module.quickstart_sns_label.id
  display_name      = var.display_name
  kms_master_key_id = var.kms_master_key_id
  tags              = module.quickstart_sns_label.tags
  access_type       = var.access_type
  protocol          = var.protocol
  endpoint          = var.endpoint
}