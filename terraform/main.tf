provider "aws" {
  region = var.region
}


terraform {
  backend "s3" {
    region         = "us-west-1"
    bucket         = "staticwebsite-terraform-s3-bucket-v1"
    key            = "state.tfstate"
    dynamodb_table = "staticwebsite-terraform-state-lock"
    encrypt        = true
  }
}

data "aws_caller_identity" "current" {}
