resource "aws_s3_bucket" "sample-dev-s3" {
  bucket = "undefeated-davout-sample-dev-001"
  arn    = "arn:aws:s3:::undefeated-davout-sample-dev-001"
  tags = merge({"Name": "${var.app_name}-${var.env}-s3"}, var.common_tags)
}
