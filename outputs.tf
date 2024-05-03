############################
#  elasticache/outputs.tf  #
############################

output "endpoint" {
  value = aws_elasticache_replication_group.redis.primary_endpoint_address
}

output "port" {
  value = aws_elasticache_replication_group.redis.port
}

output "url" {
  value = local.url
}

output "member_clusters" {
  value = aws_elasticache_replication_group.redis.member_clusters
}