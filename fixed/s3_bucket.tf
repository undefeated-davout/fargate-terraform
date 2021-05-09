resource "aws_s3_bucket" "sample-dev-s3" {
  bucket = "undefeated-davout-sample-dev-001"
  arn    = "arn:aws:s3:::undefeated-davout-sample-dev-001"

  tags = {
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-s3"
    "Service": "${var.app_name}-${var.env}"
  }
}
