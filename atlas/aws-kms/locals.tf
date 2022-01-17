locals {
  # Generic project prefix, to rename most components
  prefix = "cc-atlas"
  # Atlas Pulic providor
  provider_name = "AWS"
  # AWS Region
  aws_region = "eu-west-1"
  # Enable KMS key rotation
  enable_kms_key_rotation="true"
  tags = {
    Name      = "${local.prefix}-tf-provisioned"
    owner     = var.user_email
    expire-on = timeadd(timestamp(), "760h")
    purpose   = "training"
  }

  common_name               = lower("${var.mongodb_project_name}-mongodbatlas-encrypt")
  encrypt_at_rest_key_alias = "alias/${local.common_name}"
}

terraform {
  required_version = ">= 0.13.05"
}
