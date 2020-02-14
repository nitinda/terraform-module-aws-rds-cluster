## RDS

variable "engine" {
  description = "The name of the database engine to be used for this DB cluster."
}

variable "engine_mode" {
  description = "The database engine mode."
}

variable "database_name" {
  description = "Name for an automatically created database on cluster creation."
}

variable "cluster_identifier_prefix" {
  description = "Creates a unique cluster identifier beginning with the specified prefix"
}

variable "master_username" {
  description = "Username for the master DB user"
}

variable "master_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
}

variable "storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted"
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted."
  default     = false
}

variable "backup_retention_period" {
  description = "The days to retain backups for. Default 1"
  default = 1
}

variable "port" {
  description = "The port on which the DB accepts connections"
  type        = number
}

variable "apply_immediately" {
  description = "Determines whether or not any DB modifications are applied immediately, or during the maintenance window"
}

variable "db_subnet_group_name" {
  description = "A DB subnet group to associate with this DB instance"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate with the Cluster"
  type        = list(string)
}

variable "db_cluster_parameter_group_name" {
  description = "A cluster parameter group to associate with the cluster."
}

variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key."
  default     = null
}

variable "scaling_configuration" {
  description = "Nested attribute with scaling properties."
  type        = any
  default     = []
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to export to cloudwatch"
  default = null
}

## Tags
variable "tags" {
  description = "Resources Tags"
  type        = map(string)
}

