variable "cloud_provider_access_name" {
  default = "AWS"
}
variable "public_key" {

}
variable "private_key" {

}
variable "access_key" {

}
variable "secret_key" {

}
variable "aws_region" {
  default = "us-east-1"
}

variable "mongodb_project_name" {

}
variable "enable_kms_key_rotation" {
  default = "true"
}
variable "mongodb_cluster_name" {
  default = "atlas"
}

variable "admin_password" {
  description = "Password for default users"
  type        = string
}
variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "private_key_path" {
  description = "Access path to private key"
  type        = string
}

variable "provisioning_address_cdr" {
  description = "SSH firewall source address, home/office !?"
  type        = string
}

variable "user_email" {
  description = "Email address to add as tag"
  type        = string
  default     = "somebody@example.com"
}
variable "project_id" {
  description = "Atlas Existin Project ID Key"
  type        = string
}
