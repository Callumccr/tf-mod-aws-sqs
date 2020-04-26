# -----------------------------------------------------------------------------
# Variables: Common AWS Provider - Autoloaded from Terragrunt
# -----------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars."
  type        = string
  default     = ""
}

variable "aws_account_id" {
  description = "The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars"
  type        = string
  default     = ""
}

variable "aws_assume_role_arn" {
  description = "(Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars."
  type        = string
  default     = ""
}

variable "aws_assume_role_session_name" {
  description = "(Optional) - The session name to use when making the AssumeRole call."
  type        = string
  default     = ""
}

variable "aws_assume_role_external_id" {
  description = "(Optional) - The external ID to use when making the AssumeRole call."
  type        = string
  default     = ""
}

variable "availability_zones" {
  description = "(Required) - The AWS avaialbility zones (e.g. ap-southeast-2a/b/c). Autoloaded from region.tfvars."
  type        = list(string)
}

# -----------------------------------------------------------------------------
# Variables: TF-MOD-AWS-SQS
# -----------------------------------------------------------------------------

variable "enabled" {
  description = "(Optional) - A Switch that decides whether to create a terraform resource or run a provisioner. Default is true"
  type        = bool
  default     = true
}

variable "queue_name" {
  description = "(Optional) - This is the human-readable name of the queue. If omitted, Terraform will assign a random name."
  type        = list(string)
  default     = []
}

variable "name_prefix" {
  description = "(Optional) - A unique name beginning with the specified prefix."
  type        = string
  default     = ""
}

variable "visibility_timeout_seconds" {
  description = "(Optional) - The visibility timeout for the queue. An integer from 0 to 43200 (12 hours). The default for this attribute is 30. For more information about visibility timeout"
  type        = number
  default     = 30
}

variable "message_retention_seconds" {
  description = "(Optional) - The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days). The default for this attribute is 345600 (4 days)."
  type        = number
  default     = 345600
}

variable "max_message_size" {
  description = "(Optional) - The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). The default for this attribute is 262144 (256 KiB)."
  type        = number
  default     = 262144
}

variable "delay_seconds" {
  description = "(Optional) - The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes). The default for this attribute is 0 seconds."
  type        = number
  default     = 0
}

variable "receive_wait_time_seconds" {
  description = "(Optional) - The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds). The default for this attribute is 0, meaning that the call will return immediately."
  type        = number
  default     = 0
}

variable "policy" {
  description = "(Optional) - The JSON policy for the SQS queue. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide."
  type        = string
  default     = ""
}

variable "redrive_policy" {
  description = "(Optional) - The JSON policy to set up the Dead Letter Queue, see AWS docs"
  type        = string
  default     = ""
}

variable "fifo_queue" {
  description = "(Optional) - Boolean designating a FIFO queue. If not set, it defaults to false making it standard."
  type        = bool
  default     = false
}

variable "content_based_deduplication" {
  description = "(Optional) - Enables content-based deduplication for FIFO queues."
  type        = bool
  default     = false
}

variable "kms_master_key_id" {
  description = "(Optional) - The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK"
  type        = string
  default     = ""
}

variable "kms_data_key_reuse_period_seconds" {
  description = "(Optional) - The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours). The default is 300 (5 minutes)."
  type        = number
  default     = 300
}

variable "sqs_policy_principal" {
  description = "The Principal ARN to add to the SQS queue to allow SQS actions against the queue"
  type        = string
  default     = "*"
}

# -----------------------------------------------------------------------------
# Variables: TF-MOD-LABEL
# -----------------------------------------------------------------------------

variable "namespace" {
  type        = string
  default     = ""
  description = "(Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core'"
}

variable "environment" {
  type        = string
  default     = ""
  description = "(Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod'"
}

variable "name" {
  type        = string
  default     = ""
  description = "(Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline'"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "(Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "(Optional) - Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "(Optional) - Additional tags"
}
