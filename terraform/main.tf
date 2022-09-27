terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

module "ecr" {
  source  = "./modules/ecr"
  app_dir = "src"
  name_container = "kori-demo-container"
}
