variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "description" {
  description = "Description of the Lambda function"
  type        = string
  default     = ""
}

variable "handler" {
  description = "The function entrypoint in your code"
  type        = string
  default     = "index.handler"
}

variable "runtime" {
  description = "The runtime environment for the Lambda function"
  type        = string
  default     = "python3.11"
}

variable "timeout" {
  description = "The amount of time your Lambda Function has to run in seconds"
  type        = number
  default     = 30
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime"
  type        = number
  default     = 128
}

variable "package_type" {
  description = "The Lambda deployment package type. Valid values are Zip and Image"
  type        = string
  default     = "Zip"
}

# Source code options
variable "filename" {
  description = "The path to the function's deployment package within the local filesystem"
  type        = string
  default     = null
}

variable "s3_bucket" {
  description = "The S3 bucket location containing the function's deployment package"
  type        = string
  default     = null
}

variable "s3_key" {
  description = "The S3 key of an object containing the function's deployment package"
  type        = string
  default     = null
}

variable "s3_object_version" {
  description = "The object version containing the function's deployment package"
  type        = string
  default     = null
}

variable "image_uri" {
  description = "The ECR image URI containing the function's deployment package"
  type        = string
  default     = null
}

# Layers
variable "layers" {
  description = "List of Lambda Layer Version ARNs to attach to your Lambda Function"
  type        = list(string)
  default     = []
}

# Environment
variable "environment_variables" {
  description = "A map of environment variables to pass to the Lambda function"
  type        = map(string)
  default     = {}
}

# VPC Configuration
variable "vpc_subnet_ids" {
  description = "List of subnet IDs associated with the Lambda function"
  type        = list(string)
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs associated with the Lambda function"
  type        = list(string)
  default     = null
}

# Dead Letter Queue
variable "dead_letter_target_arn" {
  description = "The ARN of an SNS topic or SQS queue to notify when an invocation fails"
  type        = string
  default     = null
}

# Tracing
variable "tracing_mode" {
  description = "Can be either PassThrough or Active. If PassThrough, Lambda will only trace the request from an upstream service"
  type        = string
  default     = null
}

# Storage
variable "ephemeral_storage_size" {
  description = "The size of the Lambda function Ephemeral storage (/tmp) in MB"
  type        = number
  default     = null
}

# Concurrency
variable "reserved_concurrent_executions" {
  description = "The amount of reserved concurrent executions for this Lambda function"
  type        = number
  default     = -1
}

# Publishing
variable "publish" {
  description = "Whether to publish creation/change as new Lambda Function Version"
  type        = bool
  default     = false
}

# CloudWatch Logs
variable "log_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group"
  type        = number
  default     = 7
}

variable "log_kms_key_id" {
  description = "The ARN of the KMS Key to use when encrypting log data"
  type        = string
  default     = null
}

# IAM Role
variable "create_role" {
  description = "Whether to create a new IAM role for the Lambda function"
  type        = bool
  default     = true
}

variable "lambda_role_arn" {
  description = "The ARN of an existing IAM role to use for the Lambda function (only used if create_role is false)"
  type        = string
  default     = null
}

variable "custom_iam_policy_json" {
  description = "Custom IAM policy JSON document to attach to the Lambda role"
  type        = string
  default     = null
}

variable "additional_policy_arns" {
  description = "Set of additional policy ARNs to attach to the Lambda role"
  type        = set(string)
  default     = []
}

# Lambda Permissions
variable "allowed_triggers" {
  description = "Map of allowed triggers to create Lambda permissions"
  type = map(object({
    principal      = string
    source_arn     = optional(string)
    source_account = optional(string)
  }))
  default = {}
}

# Function URL
variable "create_function_url" {
  description = "Whether to create a Lambda function URL"
  type        = bool
  default     = false
}

variable "function_url_authorization_type" {
  description = "The type of authentication that the function URL uses. Valid values: AWS_IAM or NONE"
  type        = string
  default     = "AWS_IAM"
}

variable "function_url_cors" {
  description = "CORS configuration for the Lambda function URL"
  type = object({
    allow_credentials = optional(bool)
    allow_headers     = optional(list(string))
    allow_methods     = optional(list(string))
    allow_origins     = optional(list(string))
    expose_headers    = optional(list(string))
    max_age           = optional(number)
  })
  default = null
}

# Aliases
variable "aliases" {
  description = "Map of aliases to create for the Lambda function"
  type = map(object({
    description      = optional(string)
    function_version = optional(string)
    routing_config = optional(object({
      additional_version_weights = map(number)
    }))
  }))
  default = {}
}

# Tags
variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

