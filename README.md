# MongoDB Terraform templates

Several terraform templates for AWS, GCP and MongoDB Atlas resources

## How to Use

These templates can be run individually or by combining them together to achieve a desired endstate.
For instance, you can combine _atlas/aws-kms_ with _atlas/aws-private-endpoint_ and _atlas/clusters_ to create a MongoDB Atlas cluster that uses BYOK with AWS KMS and an AWS Private Endpoint for the network. In this case it would probably also make sense to to use _aws/ec2-instance_ so you can use the mongo shell to test this network setup

You can also run them individually to create a resource available to be used, such as _atlas/aws-kms_ so that you can use this setup in multiple deployments in the future

> **_NOTE:_** Some of the scripts are dependent on on another - for instance, to create an AWS EC2 instance you need to have an existing VPC network. You can either replace the dependency with the IDs of existing resources, or you can copy those resources from other files to fix that depedency

## MongoDB Atlas

Here you can find several templates that create resources to be used with MongoDB Atlas

### AWS KMS

Creates a MongoDB Atlas AWS KMS setup that can then be used to create clusters with BYOK

### AWS Private Endpoint

Creates a MongoDB Atlas AWS Private Endpoint in the specified region for network access

### GCP Private Endpoint

Creates a MongoDB Atlas GCP Private Endpoint in the specified region for network access

### Atlas Cluster

Creates a MongoDB Atlas Cluster (can be a multi-cloud cluster depending on the configuration)

## AWS

Simple AWS EC2 instance preinstalled with mongodb and python

## GCP

Simple GCP VM instance preinstalled with mongodb and python

## Tips and Tricks

You can import existing resources into your terraform state - see instructions [here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#import) for an example of importing an existing AWS VPC network

> **_NOTE:_** Make sure you are logged in in GCP using _gcloud_ or AWS with valid access keys
