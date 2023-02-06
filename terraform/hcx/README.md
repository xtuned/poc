<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.39.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.39.0 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/4.39.0/docs/resources/instance) | resource |
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/4.39.0/docs/resources/key_pair) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/4.39.0/docs/resources/security_group) | resource |
| [local_file.ssh_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_availability_zones.this](https://registry.terraform.io/providers/hashicorp/aws/4.39.0/docs/data-sources/availability_zones) | data source |
| [aws_ssm_parameter.ubuntu_18_04](https://registry.terraform.io/providers/hashicorp/aws/4.39.0/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.ubuntu_20_04](https://registry.terraform.io/providers/hashicorp/aws/4.39.0/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.windows](https://registry.terraform.io/providers/hashicorp/aws/4.39.0/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attach_public_ip"></a> [attach\_public\_ip](#input\_attach\_public\_ip) | choose to attach public ip or not | `bool` | `false` | no |
| <a name="input_cidr_blocks"></a> [cidr\_blocks](#input\_cidr\_blocks) | IP range to allow rdp connection | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | aws ec2 instance type | `string` | `"t3.large"` | no |
| <a name="input_region"></a> [region](#input\_region) | region to provision resources | `string` | `"us-east-1"` | no |
| <a name="input_stack_name"></a> [stack\_name](#input\_stack\_name) | stack name for this project | `string` | `"demo"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | subnet id for this resource | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags to associate to this resource | `map(string)` | n/a | yes |
| <a name="input_vms"></a> [vms](#input\_vms) | vm names | <pre>map(object({<br>    Name = string<br>    ami = string<br>    instance_type = string<br>    add_user_data = bool<br>  }))</pre> | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | vpc id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | n/a |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | n/a |
<!-- END_TF_DOCS -->