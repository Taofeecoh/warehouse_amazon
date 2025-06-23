resource "random_password" "egnrdb-password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_ssm_parameter" "master_username" {
  name        = "/production/database/master/username"
  description = "The parameter description"
  type        = "String"
  value       = "admin"
}

resource "aws_ssm_parameter" "egnr-password" {
  name        = "/production/egnr-db/password/master"
  description = "The parameter description"
  type        = "String"
  value       = random_password.egnrdb-password.result

  tags = local.common_tags
}

resource "aws_redshift_cluster" "egnr" {
  cluster_identifier = "tf-egnr-cluster"
  database_name      = "egnr-db"
  master_username    = aws_ssm_parameter.master_username.value
  master_password    = aws_ssm_parameter.egnr-password.value
  node_type          = "dc1.large"
  cluster_type       = "multi-node"
  number_of_nodes    = 3

  tags = local.common_tags
}
