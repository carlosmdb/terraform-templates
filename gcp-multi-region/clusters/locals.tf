locals {
  # Generic project prefix, to rename most components
  prefix = "cc-atlas"
  # Atlas region,https://docs.atlas.mongodb.com/reference/amazon-aws/#std-label-amazon-aws
  region1_name = "WESTERN_EUROPE"
  region2_name = "EUROPE_WEST_2"
  # Atlas cluster name
  cluster_name = "${local.prefix}-cluster"
  # Atlas Pulic providor
  provider_name = "GCP"
  # Atlas size name 
  atlas_size_name = "M30"
  # Atlas user name
  admin_username = "demouser1"
}

terraform {
  required_version = ">= 0.13.05"
}
