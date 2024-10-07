terraform {
  backend "s3" {
    bucket         = "ecs-test-terraform-state-21342"
    key            = "terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "ecs-test-remote-state-lock"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
  }
}

locals {
  env    = "poc"
  region = "eu-north-1"
  account_mapping = {
    poc : "012345678912"
  }
}

provider "aws" {
  region = "eu-north-1"
  #   assume_role {
  #     role_arn = "arn:aws:iam::${lookup(local.account_mapping, local.env)}:role/terraform-role"
  #   }
}


