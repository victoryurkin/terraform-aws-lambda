########################################################
# Tags
########################################################

variable client_name {
  description = "Name of the client"
  type        = string
}

variable environment {
  description = "Name of the environment in which the resource is provisioned"
  type        = string
}

variable aws_region {
  description = "(Optional) If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee."
  type        = string
}

variable provisioning {
  description = "Is it manually provisioned or using terraform?"
  type        = string
  default     = "terraform"
}

variable defcon_level {
  description = "Level of distress!"
  type        = string
  default     = "0"
}

variable propagate_at_launch {
  description = "Propogate at launch"
  type        = bool
  default     = true
}

########################################################
# Role
########################################################

variable role_name {
  description = "(Required) - A name of the role"
  type        = string
}

variable role_policy_name {
  description = "(Required) - A name of the policy"
  type        = string
}

variable role_statements {
  description = "(Required) - A list of statements for the policy"
  type        = list
}

########################################################
# Lambda
########################################################

variable "function_name" {
  type        = string
  description = "(Required) - Lambda function name"
}

variable "handler" {
  type        = string
  description = "(Required) - The function entrypoint in your code."
}

variable "runtime" {
  type        = string
  description = "(Optional) - Runtime value. Example: nodejs12.x"
  default     = "nodejs12.x"
}

variable "environment_variables" {
  type        = map
  description = "(Optional) - A map of environment variables"
  default     = {}
}
