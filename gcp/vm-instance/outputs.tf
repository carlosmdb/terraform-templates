output "Virtual_Machine_Address" {
  description = "Virtual Machine Address"
  value       = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}
