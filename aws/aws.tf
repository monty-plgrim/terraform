terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">=1.2.0"
}

provider "aws" {
  region = "ap-northeast-2"
}

module "iam" {
  source          = "./iam"
  users           = var.users
  policies_inline = var.policies_inline
  policies_aws    = var.policies_aws
  groups          = var.groups
}
