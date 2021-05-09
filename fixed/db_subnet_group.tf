resource "aws_db_subnet_group" "sample-dev-rds-sbgr" {
  name        = "sample-dev-rds-sbgr"
  description = "DB subnet group for MySQL"
  subnet_ids = [
    aws_subnet.sample-dev-sb-pr-db-1a.id,
    aws_subnet.sample-dev-sb-pr-db-1c.id
  ]
  tags = merge({"Name": "${var.app_name}-${var.env}-rds-sbgr"}, var.common_tags)
}
