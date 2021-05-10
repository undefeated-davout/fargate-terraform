resource "aws_s3_bucket" "s3" {
  bucket = "undefeated-davout-001"
  arn    = "arn:aws:s3:::undefeated-davout-001"
  tags = merge({"Name": "${var.app_name}-${var.env}-s3"}, var.common_tags)
}
