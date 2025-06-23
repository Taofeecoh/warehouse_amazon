terraform {
  backend "s3" {
    bucket = "egnr-dept"
    key    = "production/terraform.tfstate"
    region = "eu-west-1"
  }
}
