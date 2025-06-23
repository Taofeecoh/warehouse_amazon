# resource "aws_ssm_parameter" "db-name" {
#   name        = "/production/database/name"
#   description = "The parameter description"
#   type        = "String"
#   value       = "egnr-db"
# }

resource "aws_ssm_parameter" "egnr-password" {
  name        = "/production/egnr-db/password/master"
  description = "The parameter description"
  type        = "String"
  value       = random_password.egnrdb-password.result
}
