# terraform-aws-elasticache-redis

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.55.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.55.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_parameter_group.custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | resource |
| [aws_elasticache_replication_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any modifications are applied immediately, or during the next maintenance window. | `bool` | `false` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Specifies whether minor version engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window. Only supported if the engine version is 6 or higher. | `bool` | `null` | no |
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | Automatic failover flag | `bool` | n/a | yes |
| <a name="input_custom_parameters"></a> [custom\_parameters](#input\_custom\_parameters) | Custom parameters of parameter group | `list(any)` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | Description | `string` | `""` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Engine version | `string` | n/a | yes |
| <a name="input_log_delivery_configuration"></a> [log\_delivery\_configuration](#input\_log\_delivery\_configuration) | Configuration For logs | `list(map(any))` | `[]` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Maintenance Window for cache cluster | `string` | n/a | yes |
| <a name="input_multi_az_enabled"></a> [multi\_az\_enabled](#input\_multi\_az\_enabled) | falg for enable multi az | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Redis name | `string` | n/a | yes |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | Node type | `string` | n/a | yes |
| <a name="input_number_cache_clusters"></a> [number\_cache\_clusters](#input\_number\_cache\_clusters) | Nuber of instance in cluster | `number` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | Redis port | `number` | `"6379"` | no |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | Security group id | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet ids for subnet group | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_member_clusters"></a> [member\_clusters](#output\_member\_clusters) | n/a |
| <a name="output_port"></a> [port](#output\_port) | n/a |
| <a name="output_reader_endpoint"></a> [reader\_endpoint](#output\_reader\_endpoint) | n/a |
| <a name="output_url"></a> [url](#output\_url) | n/a |

## License

Apache 2 Licensed. See [LICENSE](https://github.com/TechHoldingLLC/terraform-aws-elasticache-redis/blob/main/LICENSE) for full details.