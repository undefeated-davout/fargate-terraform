# 作成後、パスワードは適宜変更する
resource "aws_rds_cluster" "rds-cl" {
  cluster_identifier  = "db"
  engine              = "aurora-mysql"
  engine_version      = "5.7.mysql_aurora.2.09.2"
  engine_mode         = "provisioned"
  database_name       = "${var.db_name}"
  skip_final_snapshot = true
  # deletion_protection = true

  availability_zones = [
    "${var.region}a",
    "${var.region}c"
  ]

  # DB情報
  master_username                 = "${var.db_user_name}"
  master_password                 = "${var.db_password}"
  backup_retention_period         = 1
  preferred_backup_window         = "09:00-09:30"
  preferred_maintenance_window    = "sat:20:00-sat:20:30"
  port                            = 3306
  vpc_security_group_ids          = [aws_security_group.sg-db.id]
  db_subnet_group_name            = "rds-sbgr"
  storage_encrypted               = true
  apply_immediately               = true
  enabled_cloudwatch_logs_exports = ["audit", "error", "slowquery"]

  // aws_rds_clusterリソースを作成すると、AZを2つ(a,c)のみ指定しているのに関わらず、
  // 3つ(a,c,d)として作成されるので、毎回差分として検出される。そのため、AZの差分を無視する。
  lifecycle {
    ignore_changes = [
      availability_zones,
      master_password,
      final_snapshot_identifier,
    ]
  }
  depends_on = [aws_db_subnet_group.rds-sbgr]
  tags = merge({"Name": "${var.app_name}-${var.env}-db"}, var.common_tags)
}

# resource "aws_rds_cluster_instance" "rds-cl-instance" {
#   count                        = 2
#   engine                       = "aurora-mysql"
#   identifier                   = "db-instance-1"
#   cluster_identifier           = aws_rds_cluster.rds-cl.id
#   instance_class               = "db.t2.small"
#   publicly_accessible          = false
#   monitoring_interval          = 60
#   preferred_maintenance_window = "sat:21:00-sat:21:30"
#   auto_minor_version_upgrade   = true
#   monitoring_role_arn          = aws_iam_role.rds-monitoring-role.arn
#   depends_on                   = [aws_db_subnet_group.rds-sbgr]
#  tags = merge({"Name": "${var.app_name}-${var.env}-db"}, var.common_tags)
# }
