output "Virtual_Machine_Address" {
  description = "Virtual Machine Address"
  value       = aws_instance.instance.public_ip
}
