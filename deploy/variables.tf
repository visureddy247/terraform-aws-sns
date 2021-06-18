variable "region" {
  default = "us-east-1"
}

variable "namespace" {
  description = "namespace, which could be your organiation name, e.g. amazon."
  default     = "myorg"
}

variable "environment" {
  type        = string
  default     = "preprod"
  description = "Environment area, e.g. prod or preprod."
}

variable "name" {
  description = "deployment name"
  default     = "sns"
}

variable "delimiter" {
  description = "delimiter, which could be used between name, namespace and env."
  default     = "-"
}

variable "attributes" {
  default     = []
  description = "atttributes, which could be used for additional attributes."
}

variable "account" {
  description = "account, which could be AWS Account Name or Number."
  default     = "myaccount"
}

variable "project_name" {
  description = "stack name"
  default     = "myproj"
}

variable "tags" {
  default     = {}
  description = "tags, which could be used for additional tags."
}

### SNS Variabls ###
variable "display_name" {
  description = "Display Name for the SNS topic."
  type        = string
  default     = null
}

variable "kms_master_key_id" {
  description = "KMS Key to encrypt SNS topic."
  type        = string
  default     = "aws/sns"
}

variable "access_type" {
  description = "Access type for SNS topic - publish / subscribe / owner."
  type        = string
  default     = "owner"
}

variable "protocol" {
  description = "Protocol type for SNS Subscription."
  type        = string
  default     = null
}

variable "endpoint" {
  description = "Protocol endpoint for SNS Subscription."
  type        = string
  default     = null
}