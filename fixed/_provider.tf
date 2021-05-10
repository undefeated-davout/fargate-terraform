provider "aws" {
  region = "${local.region}"
}

terraform {
  required_providers {
    aws = {
      version = "~> 3.39.0"
    }
  }
  required_version = ">= 0.15.1"
}
