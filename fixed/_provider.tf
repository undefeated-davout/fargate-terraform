provider "aws" {
  region = "${var.region}"
}

terraform {
  required_providers {
    aws = {
      version = "~> 3.39.0"
    }
  }
}
