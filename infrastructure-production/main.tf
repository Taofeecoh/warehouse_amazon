terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}


resource "random_password" "egnrdb-password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}


resource "aws_redshift_cluster" "egnr" {
  cluster_identifier = "tf-egnr-cluster"
  database_name      = "egnr-db"
  master_username    = "admin"
  master_password    = random_password.egnrdb-password.result
  node_type          = "dc1.large"
  cluster_type       = "multi-node"
  number_of_nodes    = 3
}

