resource "google_compute_instance" "default" {
  name         = "${var.prefix}-locust"
  machine_type = "e2-small"
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    network = google_compute_network.default.id

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    sshKeys = "${var.gcp_ssh_user}:${file(var.gcp_ssh_pub_key_file)}"
  }

  metadata_startup_script = local.metadata_startup_script

}
