#########################
#  elasticache/main.tf  #
#########################


locals {
  url = "redis://${aws_elasticache_replication_group.redis.primary_endpoint_address}:${aws_elasticache_replication_group.redis.port}"
}

resource "aws_elasticache_replication_group" "redis" {
  multi_az_enabled           = var.multi_az_enabled
  automatic_failover_enabled = var.multi_az_enabled ? true : false
  apply_immediately          = var.apply_immediately
  replication_group_id       = var.name
  description                = length(var.description) > 0 ? var.description : "${replace((var.name), "-", " ")}"
  node_type                  = var.node_type
  num_cache_clusters         = var.number_cache_clusters
  parameter_group_name       = length(var.custom_parameters) > 0 ? aws_elasticache_parameter_group.custom[0].name : null
  engine                     = "redis"
  engine_version             = var.engine_version
  port                       = var.port
  at_rest_encryption_enabled = true
  subnet_group_name          = aws_elasticache_subnet_group.redis.name
  security_group_ids = [
    var.security_group_id
  ]
  user_group_ids             = var.create_user ? [aws_elasticache_user_group.user_group[0].id] : []
  maintenance_window         = var.maintenance_window
  auto_minor_version_upgrade = var.auto_minor_version_upgrade

  dynamic "log_delivery_configuration" {
    for_each = var.log_delivery_configuration

    content {
      destination      = lookup(log_delivery_configuration.value, "destination", null)
      destination_type = lookup(log_delivery_configuration.value, "destination_type", null)
      log_format       = lookup(log_delivery_configuration.value, "log_format", null)
      log_type         = lookup(log_delivery_configuration.value, "log_type", null)
    }
  }

  lifecycle {
    ignore_changes  = [engine_version]
    prevent_destroy = true
  }
}

resource "aws_elasticache_subnet_group" "redis" {
  name       = var.name
  subnet_ids = var.subnet_ids
}

#-------------------------------------------------------------------------------
# Parameter group
#-------------------------------------------------------------------------------
resource "aws_elasticache_parameter_group" "custom" {
  count  = length(var.custom_parameters) > 0 ? 1 : 0
  name   = "${var.name}-redis-v${replace(var.engine_version, ".", "-")}-custom"
  family = "redis${split(".", var.engine_version)[0]}.x"

  dynamic "parameter" {
    for_each = var.custom_parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_elasticache_user" "user" {
  for_each      = var.create_user ? var.users : []
  user_id       = each.value.user_id
  user_name     = each.value.user_name
  access_string = each.value.access_string
  engine        = "REDIS"
  passwords     = each.value.passwords
}

resource "aws_elasticache_user_group" "user_group" {
  count         = var.create_user ? 1 : 0
  engine        = "REDIS"
  user_group_id = var.user_group_id
  user_ids      = [aws_elasticache_user.user.*.user_id]

  lifecycle {
    ignore_changes = [user_ids]
  }
}