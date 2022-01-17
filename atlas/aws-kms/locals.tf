locals {
  # Generic project prefix, to rename most components
  prefix = "cc-atlas"
  # Atlas Pulic providor
  provider_name = "AWS"
  # AWS Region
  aws_region = "eu-west-1"
  # Enable KMS key rotation
  enable_kms_key_rotation="true"
  tags = {
    Name      = "${local.prefix}-tf-provisioned"
    owner     = var.user_email
    expire-on = timeadd(timestamp(), "760h")
    purpose   = "training"
  }

  common_name               = lower("${var.mongodb_project_name}-mongodbatlas-encrypt")
  encrypt_at_rest_key_alias = "alias/${local.common_name}"

  user_data = <<-EOT
  #!/bin/bash
  
  cat << EOF >> /etc/security/limits.conf
  * soft     nproc          65535    
  * hard     nproc          65535   
  * soft     nofile         65535   
  * hard     nofile         65535
  root soft     nproc          65535    
  root hard     nproc          65535   
  root soft     nofile         65535   
  root hard     nofile         65535
  EOF

  cat << EOF >> /etc/pam.d/common-session
  session required pam_limits.so
  EOF

  apt-get -y update && apt-get -y install python3 python3-pip git python3.8-venv
  pip3 install pymongo==4.0.1
  pip3 install faker
  pip3 install dnspython

  wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -
  echo 'deb [ arch=amd64,arm64 ] http://repo.mongodb.com/apt/ubuntu bionic/mongodb-enterprise/5.0 multiverse' | tee /etc/apt/sources.list.d/mongodb-enterprise.list
  apt-get update
  apt-get install -y mongodb-enterprise mongodb-enterprise-shell mongodb-enterprise-tools

  EOT
}

terraform {
  required_version = ">= 0.13.05"
}
