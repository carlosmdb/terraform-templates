output "name" {
  description = "Name of the created mongodb atlas cluster"
  value       = var.mongodb_cluster_name
}

output "cluster_id" {
  description = "Id of the created cluster"
  value       = mongodbatlas_advanced_cluster.cluster.id
}

output "project_id" {
  description = "Id of the created project"
  value       = var.project_id
}

output "connection_strings" {
  description = "Database connection string"
  value       = mongodbatlas_advanced_cluster.cluster.connection_strings
}

output "user1" {
  value = mongodbatlas_database_user.user1.username
}

output "atlasclusterstring" {
  value = mongodbatlas_advanced_cluster.cluster.connection_strings[0].aws_private_link_srv
}

output "connection_string" {
  value = join("", [
    replace("${mongodbatlas_advanced_cluster.cluster.connection_strings[0].private_endpoint[0].srv_connection_string}", "mongodb+srv://", "mongodb+srv://${local.admin_username}:${var.admin_password}@"),
  "/bank"])
}
