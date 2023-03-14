terraform {
  required_version = ">= 0.12.0"
  required_providers {
    aws = ">= 2.0.0"
  }

  backend "s3" {
    bucket  = "terraformstatebucket20230313"
    profile = "terraform"
    key     = "terraform.tfstate"
    region  = "us-east-1"
  }
}