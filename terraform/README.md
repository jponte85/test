<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0, < 2.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0, < 6.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0.0, < 6.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_my_webserver"></a> [my\_webserver](#module\_my\_webserver) | ./ec2 | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.flow_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_default_network_acl.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_network_acl) | resource |
| [aws_default_route_table.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table) | resource |
| [aws_default_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_security_group) | resource |
| [aws_flow_log.vpc_flow_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_iam_policy.flow_logs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.flow_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.flow_logs_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lb.my_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.example_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.lb_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_route_table.private_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_association_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_association_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.sg_allow_http1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.sg_allow_http2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.sg_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.private_subnet_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ec2_instance_type"></a> [ec2\_instance\_type](#input\_ec2\_instance\_type) | Instance type for the EC2 instance | `string` | `"t2.micro"` | no |
| <a name="input_ec2_subnet_id"></a> [ec2\_subnet\_id](#input\_ec2\_subnet\_id) | Subnet ID where the EC2 instance will be launched | `string` | `"aws_subnet.public_subnet_1.id"` | no |
| <a name="input_ec2_user_data"></a> [ec2\_user\_data](#input\_ec2\_user\_data) | User data script for the EC2 instance | `string` | `""` | no |
| <a name="input_ec2_vpc_security_group_ids"></a> [ec2\_vpc\_security\_group\_ids](#input\_ec2\_vpc\_security\_group\_ids) | List of security group IDs for the EC2 instance | `string` | `"aws_security_group.sg_allow_http1.id"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Type of environment mapping to Vodafone Environment Classifications | `string` | `"DEV"` | no |
| <a name="input_project"></a> [project](#input\_project) | Name of the project associated with the Project tag on AWS resources | `string` | `"pcs-test-terraform-task"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region for the resource deployment | `string` | `"eu-west-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | n/a |
| <a name="output_load_balancer_address"></a> [load\_balancer\_address](#output\_load\_balancer\_address) | n/a |
<!-- END_TF_DOCS -->