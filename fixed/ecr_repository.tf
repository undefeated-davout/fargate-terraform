resource "aws_ecr_repository" "ecr-repository" {
  name                 = "${var.app_name}-${var.env}"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = "true"
  }
  encryption_configuration {
    encryption_type = "AES256"
  }
  lifecycle {
    create_before_destroy = true
  }
}
