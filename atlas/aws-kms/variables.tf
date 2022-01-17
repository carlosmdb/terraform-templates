variable "atlas_public_key" {
  description = "MongoDB Atlas Public Key"
  type = string
}
variable "atlas_private_key" {
  description = "MongoDB Atlas Private Key"
  type = string
}
variable "user_email" {
  description = "Email address to add as tag"
  type        = string
  default     = "somebody@example.com"
}
variable "project_id" {
  description = "Atlas Existing Project ID Key"
  type        = string
}

variable "mongodb_project_name" {
  description = "Atlas Existing Project name"
  type        = string
}