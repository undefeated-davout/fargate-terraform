locals {
  // 共通情報
  region = "ap-northeast-1"
  app_name = "sampleapp"
  env = "dev"
  common_tags = {
    "Service": "sampleapp-dev"
    "Env": "dev"
  }
  // pem
  pem_name = "cnapp_key"
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
