resource "aws_s3_bucket" "sample-dev-s3" {
  bucket = "undefeated-davout-sample-dev-001"
  arn    = "arn:aws:s3:::undefeated-davout-sample-dev-001"

  tags = {
    Env     = "dev"
    Name    = "sample-dev-s3"
    Service = "sample-dev"
  }
}
