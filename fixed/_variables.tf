// 共通情報
variable "aws_account_id" {default = "hogehoge"}
variable "region" {default = "ap-northeast-1"}
variable "app_name" {default = "sampleapp"}
variable "env" {default = "dev"}
variable "common_tags" {default = {
  "Service": "sampleapp-dev"
  "Env": "dev"
}}

// pem
variable "pem_name" {default = "cnapp_key"}
// DB
variable "db_name" {default = "sampledb"}
variable "db_user_name" {default = "admin"}
variable "db_password" {default = "samplepassword"}
// S3
variable "s3_bucket_name" {default = "undefeated-davout-001"}
