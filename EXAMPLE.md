# Elasticache
Below is an examples of calling this module.



## Create Elasticache Redis cache
```
module "redis" {
  source = "git::https://github.com/TechHoldingLLC/terraform-aws-elasticache-redis.git"

  name                  = "redis-app"
  node_type             = "cache.t4g.micro"
  number_cache_clusters = 2  # Should be Greater than 1 while multi az is enabled
  multi_az_enabled      = true # If multi AZ true, automatic_failover_enabled will be set to true
  maintenance_window    = "sun:09:00-sun:10:00"

  subnet_ids        = local.db_subnets_id
  engine_version    = "7.0"
  port              = "6379"
  security_group_id = module.security_group_redis.id

  log_delivery_configuration = [
    {
      destination      = aws_cloudwatch_log_group.redis_slow_logs.name
      destination_type = "cloudwatch-logs"
      log_format       = "json"
      log_type         = "slow-log"
    }
  ]
}
```