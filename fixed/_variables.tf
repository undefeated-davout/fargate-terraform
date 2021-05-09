variable "aws_account_id" {default = "hogehoge"}
variable "region" {default = "ap-northeast-1"}
variable "app_name" {default = "sampleapp"}
variable "env" {default = "dev"}
variable "database_name" {default = "sampledb"}
variable "common_tags" {default = {
  "Service": "sampleapp-dev"
  "Env": "dev"
}}
variable "pem_name" {default = "cnapp_key"}
