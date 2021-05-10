resource "aws_s3_bucket" "s3" {
  bucket = "${var.s3_bucket_name}"
  arn    = "arn:aws:s3:::${var.s3_bucket_name}"
  tags = merge({"Name": "${var.app_name}-${var.env}-s3"}, var.common_tags)
}
