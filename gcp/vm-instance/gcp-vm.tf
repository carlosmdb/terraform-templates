resource "google_compute_instance" "default" {
  name         = "${local.prefix}-locust"
  machine_type = local.gcp_vm_instance
  zone         = local.gcp_zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  # NOTE: if you don't include this file as part of a complete GCP deployment
  # you might need to either create a new network to create this VM instance in
  # or you can also import existing network configurations to terraform
  # or you can just set the existing ids instead of the reference
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

  labels = local.tags

}
