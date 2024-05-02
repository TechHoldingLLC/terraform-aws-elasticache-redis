##############################
#  elasticache/variables.tf  #
##############################

variable "apply_immediately" {
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Specifies whether minor version engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window. Only supported if the engine version is 6 or higher."
  type        = bool
  default     = null
}

variable "custom_parameters" {
  description = "Custom parameters of parameter group"
  type        = list(any)
  default     = []
}

variable "description" {
  description = "Description"
  type        = string
  default     = ""
}

variable "engine_version" {
  description = "Engine version"
  type        = string
}

variable "log_delivery_configuration" {
  description = "Configuration For logs"
  type        = list(map(any))
  default     = []
}

variable "multi_az_enabled" {
  description = "falg for enable multi az"
  type        = bool
  default     = false
}

variable "maintenance_window" {
  description = "Maintenance Window for cache cluster"
  type        = string
}

variable "name" {
  description = "Redis name"
  type        = string
}

variable "node_type" {
  description = "Node type"
  type        = string
}

variable "number_cache_clusters" {
  description = "Nuber of instance in cluster"
  type        = number
}

variable "port" {
  description = "Redis port"
  type        = number
  default     = "6379"
}

variable "security_group_id" {
  description = "Security group id"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet ids for subnet group"
}