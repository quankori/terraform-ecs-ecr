terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

module "ecr" {
  source  = "./modules/ecr"
  prefix  = "kori"
  app_dir = "src"
}
