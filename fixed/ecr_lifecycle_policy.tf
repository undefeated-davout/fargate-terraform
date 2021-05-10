resource "aws_ecr_lifecycle_policy" "ecr-lc-policy" {
  repository = "${var.app_name}-${var.env}"
  depends_on = [aws_ecr_repository.ecr-repository]

  policy = <<POLICY
{
  "rules": [
    {
      "action": {
        "type": "expire"
      },
      "description": "古い世代のイメージを削除",
      "rulePriority": 1,
      "selection": {
        "countNumber": 30,
        "countType": "imageCountMoreThan",
        "tagStatus": "any"
      }
    }
  ]
}
POLICY
}
