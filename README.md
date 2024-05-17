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
| [aws_lb.my_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.example_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.lb_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->