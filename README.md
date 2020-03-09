## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| client\_name | Name of the client. | `string` | n/a | yes |
| environment | The organization environment | `string` | n/a | yes |
| aws\_region | This is the AWS region. | `string` | n/a | yes |
| provisioning | Is it manually provisioned or using terraform? | `string` | n/a | yes |
| defcon\_level | Level of distress! | `number` | n/a | yes |
| propagate\_at\_launch | Propogate at launch | `bool` | n/a | yes |
| role\_name | A name of the role | `string` | n/a | yes |
| role\_policy\_name | A name of the policy | `string` | n/a | yes |
| role\_statements | A list of statements for the policy | `list` | n/a | yes |
| function\_name | Lambda function name | `string` | n/a | yes |
| handler | The function entrypoint in your code | `string` | n/a | yes |
| runtime | Runtime value. Example: nodejs12.x | `string` | nodejs12.x | no |

## Outputs

| Name | Description | Type |
|------|-------------|:-----:|
| this\_function\_uri | Lambda function URI | `string` |
