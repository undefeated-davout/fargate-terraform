# 作成後、パスワードは適宜変更する
resource "aws_rds_cluster" "sample-dev-rds-cl" {
  cluster_identifier  = "sample-dev-db"
  engine              = "aurora-mysql"
  engine_version      = "5.7.mysql_aurora.2.09.2"
  engine_mode         = "provisioned"
  database_name       = "hogehoge"
  skip_final_snapshot = true
  # deletion_protection = true

  availability_zones = [
    "ap-northeast-1a",
    "ap-northeast-1c"
  ]

  # DB情報
  master_username                 = "admin"
  master_password                 = "password"
  backup_retention_period         = 1
  preferred_backup_window         = "09:00-09:30"
  preferred_maintenance_window    = "sat:20:00-sat:20:30"
  port                            = 3306
  vpc_security_group_ids          = [aws_security_group.sample-dev-sg-db.id]
  db_subnet_group_name            = "sample-dev-rds-sbgr"
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
  depends_on = [aws_db_subnet_group.sample-dev-rds-sbgr]
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-db"
  }
}

# resource "aws_rds_cluster_instance" "sample-dev-rds-cl-instance" {
#   count                        = 2
#   engine                       = "aurora-mysql"
#   identifier                   = "sample-dev-db-instance-1"
#   cluster_identifier           = aws_rds_cluster.sample-dev-rds-cl.id
#   instance_class               = "db.t2.small"
#   publicly_accessible          = false
#   monitoring_interval          = 60
#   preferred_maintenance_window = "sat:21:00-sat:21:30"
#   auto_minor_version_upgrade   = true
#   monitoring_role_arn          = aws_iam_role.sample-dev-rds-monitoring-role.arn
#   depends_on                   = [aws_db_subnet_group.sample-dev-rds-sbgr]
#   tags = {
#     Service = "sample-dev"
#     Env     = "dev"
#     Name    = "sample-dev-db"
#   }
# }
