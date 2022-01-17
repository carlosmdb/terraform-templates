variable "atlas_project_id" {

}
variable "atlas_public_key" {
  description = "MongoDB Atlas Public Key"
  type = string
}
variable "atlas_private_key" {
  description = "MongoDB Atlas Private Key"
  type = string
}

variable "gcp_project_id" {
  description = "GCP existing project ID"
  type = string
}

variable "gcp_ssh_user" {
  description = "GCP SSH user"
  type = string
}

variable "gcp_ssh_pub_key_file" {
description = "GCP SSH public key file path"
  type = string
}

variable "provisioning_address_cidr" {
  description = "Your provisioning address cidr block"
  type        = string
}