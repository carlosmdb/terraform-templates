locals {
  # Generic project prefix, to rename most components
  prefix = "cc-atlas"
  # Atlas region,https://docs.atlas.mongodb.com/reference/amazon-aws/#std-label-amazon-aws
  region = "EU_WEST_1"
  # IAM policy name
  aws_policy_name = "${local.prefix}-kms-policy"
  # IAM role name
  aws_role_name = "${local.prefix}-kms-role"
  # Atlas Pulic providor
  provider_name = "AWS"
  # AWS Region
  aws_region = "eu-west-1"
  # AWS Rooute block
  aws_route_cidr_block = "10.11.6.0/23"
  # AWS Subnet block
  aws_subnet1_cidr_block = "10.11.6.0/24"
  tags = {
    Name      = "${local.prefix}-tf-provisioned"
    owner     = var.user_email
    expire-on = timeadd(timestamp(), "760h")
    purpose   = "training"
  }
}

terraform {
  required_version = ">= 0.13.05"
}
