locals {
  // 踏み台サーバEC2：Amazon Linux 2 AMI (HVM), SSD Volume Type - ami-0ca38c7440de1749a (64 ビット x86)
  // // 東京リージョン用
  // region = "ap-northeast-1"
  // manage_server_ami = "ami-0ca38c7440de1749a"
  // ソウルリージョン用
  region = "ap-northeast-2"
  manage_server_ami = "ami-0f2c95e9fe3f8f80e"

  // 共通情報
  app_name = "sampleapp"
  env = "dev"
  common_tags = {
    "Service": "sampleapp-dev"
    "Env": "dev"
  }
  // pem
  pem_name = "sample_key"
  // DB
  db_endpoint = "sample-endpoint"
  db_name = "sampledb"
  db_user_name = "admin"
  db_password = "samplepassword"
  // S3
  s3_bucket_name = "undefeated-davout-001"
  // ECS
  image_target_tag = "v1"
}
