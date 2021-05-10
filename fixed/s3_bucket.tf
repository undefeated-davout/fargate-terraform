resource "aws_s3_bucket" "s3" {
  bucket = "${local.s3_bucket_name}"
  arn    = "arn:aws:s3:::${local.s3_bucket_name}"
  tags = merge({"Name": "${local.app_name}-${local.env}-s3"}, local.common_tags)
}
