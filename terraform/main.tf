provider "aws" {
  region = var.region
}


terraform {
  backend "s3" {
    bucket       = "staticwebsite-terraform-s3-bucket-v2"
    key          = "state.tfstate"
    region       = "us-west-1"
  }
}

data "aws_caller_identity" "current" {}
