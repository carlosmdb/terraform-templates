resource "mongodbatlas_advanced_cluster" "cluster" {
  name       = local.cluster_name
  project_id = var.project_id
  #cluster_type   = "SHARDED"
  cluster_type = "REPLICASET"
  #disk_size_gb                = 256
  encryption_at_rest_provider = "AWS"
  mongo_db_major_version      = "5.0"
  backup_enabled              = true
  pit_enabled                 = true

  replication_specs {
    #num_shards = 2
    region_configs {
      electable_specs {
        instance_size = "M10"
        node_count    = 3
      }
      provider_name = local.provider_name
      region_name   = local.region
      priority      = 7
    }

/*     region_configs {
      electable_specs {
        instance_size = "M10"
        node_count    = 2
      }
      provider_name = "GCP"
      priority      = 6
      region_name   = var.atlas_gcp_region
    } */


  }
  lifecycle {
    prevent_destroy = false
  }

  # Encryption needs to be turned on for the project before it can be enabled on the cluster
  depends_on = [mongodbatlas_encryption_at_rest.encrypt]
}

resource "mongodbatlas_database_user" "user1" {
  username           = local.admin_username
  password           = var.admin_password
  project_id         = var.project_id
  auth_database_name = "admin"

  roles {
    role_name     = "readWriteAnyDatabase"
    database_name = "admin"
  }
  labels {
    key   = "Name"
    value = local.admin_username
  }
  scopes {
    name = mongodbatlas_advanced_cluster.cluster.name
    type = "CLUSTER"
  }
}
