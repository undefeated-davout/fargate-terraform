resource "aws_vpc" "sample-dev-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-vpc"
  }
}
