variable "admin_password" {
  description = "Password for AWS EC2 instance user"
  type        = string
}
variable "key_name" {
  description = "AWS EC2 Instance key name"
  type        = string
}

variable "private_key_path" {
  description = "AWS EC2 Instance access path to private key"
  type        = string
}
variable "user_email" {
  description = "Your user email for tagging the resources"
  type = string
}