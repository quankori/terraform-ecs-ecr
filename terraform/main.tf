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
