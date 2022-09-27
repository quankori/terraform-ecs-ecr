provider "aws" {
  region = local.region
}

locals {
  region = "us-west-2"
}

data "aws_caller_identity" "current" {}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
module "ecr" {
  source         = "./modules/ecr"
  app_dir        = "src"
  name_container = "kori-demo-container"
  account_id     = data.aws_caller_identity.current.account_id
  region         = local.region
}

module "vpc" {
  source             = "./modules/vpc"
  cidr               = "10.0.0.0/16"
  public_subnets     = ["10.0.16.0/20", "10.0.48.0/20"]
  private_subnets    = ["10.0.0.0/20", "10.0.32.0/20"]
  availability_zones = ["us-west-2a", "us-west-2b"]
}
