resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"
  tags = {
    "Service": "${var.app_name}-${var.env}"
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-vpc"
  }
}
