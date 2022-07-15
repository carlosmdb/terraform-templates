# Create a Google Network
resource "google_compute_network" "region2" {
  project = var.gcp_project_id
  name    = "${local.prefix}-network-region2"
}

# Create a Google Sub Network
resource "google_compute_subnetwork" "region2" {
  project       = google_compute_network.region2.project
  name          = "${local.prefix}-subnet-region2"
  ip_cidr_range = "10.0.0.0/16"
  region        = local.gcp_region2
  network       = google_compute_network.region2.id
}

# Open firewall to local ip address
resource "google_compute_firewall" "region2" {
  name    = "${local.prefix}-firewall-region2"
  network = google_compute_network.region2.name

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
resource "google_compute_address" "region2" {
  count        = 50
  project      = google_compute_subnetwork.region2.project
  name         = "${local.prefix}-${count.index}-region2"
  subnetwork   = google_compute_subnetwork.region2.id
  address_type = "INTERNAL"
  address      = "10.0.42.${count.index}"
  region       = local.gcp_region2

  depends_on = [mongodbatlas_privatelink_endpoint.region2]
}

# Create 50 Forwarding rules
resource "google_compute_forwarding_rule" "region2" {
  count                 = 50
  project               = var.gcp_project_id
  region                = local.gcp_region2
  name                  = "${local.prefix}-${count.index}-region2"
  target                = mongodbatlas_privatelink_endpoint.region2.service_attachment_names[count.index]
  ip_address            = google_compute_address.region2[count.index].id
  network               = google_compute_network.region2.id
  load_balancing_scheme = ""
}
