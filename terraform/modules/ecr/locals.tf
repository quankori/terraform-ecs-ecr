locals {
  app_dir             = var.app_dir
  account_id          = data.aws_caller_identity.current.account_id
  ecr_repository_name = var.name_container
  ecr_image_tag       = "latest"
  ecr_id              = "${local.account_id}.dkr.ecr.${var.region}.amazonaws.com"
}
