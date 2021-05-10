resource "aws_db_subnet_group" "rds-sbgr" {
  name        = "${local.app_name}-${local.env}-rds-sbgr"
  description = "DB subnet group for MySQL"
  subnet_ids = [
    aws_subnet.sb-pr-db-a.id,
    aws_subnet.sb-pr-db-c.id
  ]
  tags = merge({"Name": "${local.app_name}-${local.env}-rds-sbgr"}, local.common_tags)
}
