output "kms_key_id" {
  value = aws_kms_key.encrypt.key_id
}

output "kms_key_arn" {
  value = aws_kms_key.encrypt.arn
}

output "kms_key_alias" {
  value = aws_kms_alias.encrypt.name
}

output "aws_iam_role_arn" {
  value = aws_iam_role.test_role.arn
}

output "cloud_provider_access_role_id" {
  value = mongodbatlas_cloud_provider_access_setup.setup_only.role_id
}
