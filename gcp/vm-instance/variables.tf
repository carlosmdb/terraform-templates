variable "user_email" {
  description = "Your user email for tagging the resources"
  type = string
}

variable "gcp_ssh_user" {
  description = "The GCP ssh user - usually this is your <firstName><lastName>"
  type = string
}

variable "gcp_ssh_pub_key_file" {
  description = "The GCP public key file location in your machine"
  type = string
}

variable "gcp_project_id" {
  description = "The GCP project ID to host your resources"
  type = string
}

