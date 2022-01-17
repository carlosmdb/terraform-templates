# Create a Google Network
resource "google_compute_network" "default" {
  project = var.gcp_project_id
  name    = "${local.prefix}-network"
}

# Create a Google Sub Network
resource "google_compute_subnetwork" "default" {
  project       = google_compute_network.default.project
  name          = "${local.prefix}-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = local.gcp_region
  network       = google_compute_network.default.id
}

# Open firewall to local ip address
resource "google_compute_firewall" "default" {
  name    = "${local.prefix}-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "8089"]
  }

  source_ranges = [var.provisioning_address_cidr]
}

# Create Google 50 Addresses
resource "google_compute_address" "default" {
  count        = 50
  project      = google_compute_subnetwork.default.project
  name         = "${local.prefix}-${count.index}"
  subnetwork   = google_compute_subnetwork.default.id
  address_type = "INTERNAL"
  address      = "10.0.42.${count.index}"
  region       = local.gcp_region

  depends_on = [mongodbatlas_privatelink_endpoint.test]
}

# Create 50 Forwarding rules
resource "google_compute_forwarding_rule" "default" {
  count                 = 50
  project               = var.gcp_project_id
  region                = local.gcp_region
  name                  = "${local.prefix}-${count.index}"
  target                = mongodbatlas_privatelink_endpoint.test.service_attachment_names[count.index]
  ip_address            = google_compute_address.default[count.index].id
  network               = google_compute_network.default.id
  load_balancing_scheme = ""
}
