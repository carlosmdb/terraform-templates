locals {
  # Generic project prefix, to rename most components
  prefix = "cc-atlas"
  # Atlas region,https://docs.atlas.mongodb.com/reference/amazon-aws/#std-label-amazon-aws
  region_name = "EU_WEST_1"
  # Atlas cluster name
  cluster_name = "${local.prefix}-cluster"
  # Atlas Pulic providor
  provider_name = "AWS"
  # Atlas size name 
  atlas_size_name = "M10"
  # Atlas user name
  admin_username = "demouser1"
}

terraform {
  required_version = ">= 0.13.05"
}
