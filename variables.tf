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
  description = "(Required) - Runtime value. Example: nodejs12.x"
}
