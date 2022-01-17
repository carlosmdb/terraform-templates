locals {

  # GCP Region
  gcp_region                = "europe-west2"
  # GCP Zone
  gcp_zone                  = "europe-west2-a"
  # Prefix to add to resources names
  prefix                    = "cc-atlas"
  # Provider name
  provider_name             = "GCP"
  # Atlas GCP region
  atlas_gcp_region          = "EUROPE_WEST_2"

}

terraform {
  required_version = ">= 0.13.05"
}
