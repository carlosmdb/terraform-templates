resource "null_resource" "previous" {}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "30s"
}
resource "mongodbatlas_encryption_at_rest" "encrypt" {
  project_id = var.project_id

  aws_kms_config  {
    enabled                = true
    customer_master_key_id = aws_kms_key.encrypt.key_id
    region                 = upper(local.aws_region)
    role_id                = mongodbatlas_cloud_provider_access_setup.setup_only.role_id
  }

  # Unified AWS Access needs to be configured and a IAM role based trust relationship
  # established with MongoDb Atlas AWS account before we can turn on encryption.
  depends_on = [aws_kms_alias.encrypt,time_sleep.wait_30_seconds]
}