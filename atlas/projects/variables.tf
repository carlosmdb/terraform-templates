variable "atlas_public_key" {
  description = "MongoDB Atlas Public Key"
  type = string
}
variable "atlas_private_key" {
  description = "MongoDB Atlas Private Key"
  type = string
}
variable "mongodb_project_name" {

}
variable "admin_password" {
  description = "Password for default users"
  type        = string
}
variable "project_id" {
  description = "Atlas Existing Project ID Key"
  type        = string
}
