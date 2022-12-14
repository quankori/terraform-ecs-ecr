
resource "aws_ecr_repository" "repo" {
  name = local.ecr_repository_name
}

locals {
  ecr_repository_name = var.name_container
  ecr_id              = "${var.account_id}.dkr.ecr.${var.region}.amazonaws.com"
}

# The null_resource resource implements the standard resource lifecycle 
# but takes no further action.
resource "null_resource" "ecr_image" {
  # The local-exec provisioner invokes a local executable after a resource is created. 
  # This invokes a process on the machine running Terraform, not on the resource. 
  # path.module: the filesystem path of the module where the expression is placed.

  provisioner "local-exec" {
    command = <<EOF
           aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${local.ecr_id}
           cd ../${var.app_dir}
           docker build -t ${aws_ecr_repository.repo.repository_url}:${local.ecr_repository_name} .
           docker push ${aws_ecr_repository.repo.repository_url}:${local.ecr_repository_name}
       EOF
  }
}

output "ecr_url" {
  value = "${aws_ecr_repository.repo.repository_url}:${local.ecr_repository_name}"
}
