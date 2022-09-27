locals {
  prefix              = var.prefix
  app_dir             = var.app_dir
  account_id          = data.aws_caller_identity.current.account_id
  ecr_repository_name = "${local.prefix}-demo-container"
  ecr_image_tag       = "latest"
}
