provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
}
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}
