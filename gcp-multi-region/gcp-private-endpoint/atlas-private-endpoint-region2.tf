resource "mongodbatlas_privatelink_endpoint" "region2" {
  project_id    = var.atlas_project_id
  provider_name = local.provider_name
  region        = local.atlas_gcp_region2
}


resource "mongodbatlas_privatelink_endpoint_service" "region2" {
  project_id          = mongodbatlas_privatelink_endpoint.region2.project_id
  private_link_id     = mongodbatlas_privatelink_endpoint.region2.private_link_id
  provider_name       = local.provider_name
  endpoint_service_id = google_compute_network.region2.name
  gcp_project_id      = var.gcp_project_id

  dynamic "endpoints" {
    for_each = mongodbatlas_privatelink_endpoint.region2.service_attachment_names

    content {
      ip_address    = google_compute_address.region2[endpoints.key].address
      endpoint_name = google_compute_address.region2[endpoints.key].name
    }
  }

  depends_on = [google_compute_forwarding_rule.region2]
}
