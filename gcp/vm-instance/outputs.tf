output "Virtual_Machine_Address" {
  description = "Virtual Machine Address"
  value       = aws_instance.mongosh.public_ip
}


output "private_key_path" {
  value = var.private_key_path
}