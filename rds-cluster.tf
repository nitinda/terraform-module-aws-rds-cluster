resource "aws_rds_cluster" "rds_cluster" {
  engine                              = var.engine
  engine_mode                         = var.engine_mode
  engine_version                      = var.engine_version
  database_name                       = var.database_name
  cluster_identifier_prefix           = format("%s-rds-", var.cluster_identifier_prefix)
  copy_tags_to_snapshot               = var.copy_tags_to_snapshot
  master_username                     = var.master_username
  master_password                     = var.master_password
  storage_encrypted                   = var.storage_encrypted
  skip_final_snapshot                 = var.skip_final_snapshot
  backup_retention_period             = var.backup_retention_period
  port                                = var.port
  apply_immediately                   = var.apply_immediately
  db_subnet_group_name                = var.db_subnet_group_name
  vpc_security_group_ids              = var.vpc_security_group_ids
  db_cluster_parameter_group_name     = var.db_cluster_parameter_group_name
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  kms_key_id                          = var.kms_key_id
  enabled_cloudwatch_logs_exports     = var.enabled_cloudwatch_logs_exports
  dynamic "scaling_configuration" {
    for_each = var.scaling_configuration
    content {
      auto_pause               = lookup(scaling_configuration.value, "auto_pause", null)
      max_capacity             = lookup(scaling_configuration.value, "max_capacity", null)
      min_capacity             = lookup(scaling_configuration.value, "min_capacity", null)
      seconds_until_auto_pause = lookup(scaling_configuration.value, "seconds_until_auto_pause", null)
      timeout_action           = lookup(scaling_configuration.value, "timeout_action", null)
    }
  }
  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

