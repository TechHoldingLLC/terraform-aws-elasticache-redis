# Elasticache
Below is an examples of calling this module.



## Create Elasticache Redis cache
```
module "redis" {
  source = "./redis"

  name                  = "redis-app"
  node_type             = "cache.t4g.micro"
  number_cache_clusters = 2 

  multi_az_enabled           = true
  automatic_failover_enabled = true
  maintenance_window         = "sun:09:00-sun:10:00"

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