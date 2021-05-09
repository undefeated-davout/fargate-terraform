resource "aws_ecr_repository" "sample-dev-ecr-repository" {
  name                 = "sample-dev"
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
