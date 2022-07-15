# Create a Google Network
resource "google_compute_network" "region1" {
  project = var.gcp_project_id
  name    = "${local.prefix}-network-region1"
}

# Create a Google Sub Network
resource "google_compute_subnetwork" "region1" {
  project       = google_compute_network.region1.project
  name          = "${local.prefix}-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = local.gcp_region1
  network       = google_compute_network.region1.id
}

# Open firewall to local ip address
resource "google_compute_firewall" "region1" {
  name    = "${local.prefix}-firewall"
  network = google_compute_network.region1.name

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
resource "google_compute_address" "region1" {
  count        = 50
  project      = google_compute_subnetwork.region1.project
  name         = "${local.prefix}-${count.index}"
  subnetwork   = google_compute_subnetwork.region1.id
  address_type = "INTERNAL"
  address      = "10.0.42.${count.index}"
  region       = local.gcp_region1

  depends_on = [mongodbatlas_privatelink_endpoint.region1]
}

# Create 50 Forwarding rules
resource "google_compute_forwarding_rule" "region1" {
  count                 = 50
  project               = var.gcp_project_id
  region                = local.gcp_region1
  name                  = "${local.prefix}-${count.index}"
  target                = mongodbatlas_privatelink_endpoint.region1.service_attachment_names[count.index]
  ip_address            = google_compute_address.region1[count.index].id
  network               = google_compute_network.region1.id
  load_balancing_scheme = ""
}
