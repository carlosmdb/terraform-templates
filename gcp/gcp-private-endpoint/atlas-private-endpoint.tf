resource "mongodbatlas_privatelink_endpoint" "test" {
  project_id    = var.atlas_project_id
  provider_name = var.provider_name
  region        = var.atlas_gcp_region
}


resource "mongodbatlas_privatelink_endpoint_service" "test" {
  project_id          = mongodbatlas_privatelink_endpoint.test.project_id
  private_link_id     = mongodbatlas_privatelink_endpoint.test.private_link_id
  provider_name       = var.provider_name
  endpoint_service_id = google_compute_network.default.name
  gcp_project_id      = var.gcp_project_id

  dynamic "endpoints" {
    for_each = mongodbatlas_privatelink_endpoint.test.service_attachment_names

    content {
      ip_address    = google_compute_address.default[endpoints.key].address
      endpoint_name = google_compute_address.default[endpoints.key].name
    }
  }

  depends_on = [google_compute_forwarding_rule.default]
}
