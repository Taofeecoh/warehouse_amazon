terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {}
  }
}

provider "aws" {
  region = "eu-west-1"
}
