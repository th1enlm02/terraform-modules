output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.this.arn
}

output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = aws_lambda_function.this.function_name
}

output "lambda_function_qualified_arn" {
  description = "The ARN identifying your Lambda Function Version"
  value       = aws_lambda_function.this.qualified_arn
}

output "lambda_function_version" {
  description = "Latest published version of your Lambda Function"
  value       = aws_lambda_function.this.version
}

output "lambda_function_invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway"
  value       = aws_lambda_function.this.invoke_arn
}

output "lambda_function_last_modified" {
  description = "The date this resource was last modified"
  value       = aws_lambda_function.this.last_modified
}

output "lambda_function_source_code_hash" {
  description = "Base64-encoded representation of raw SHA-256 sum of the zip file"
  value       = aws_lambda_function.this.source_code_hash
}

output "lambda_function_source_code_size" {
  description = "The size in bytes of the function .zip file"
  value       = aws_lambda_function.this.source_code_size
}

output "lambda_role_arn" {
  description = "The ARN of the IAM role created for the Lambda function"
  value       = var.create_role ? aws_iam_role.lambda[0].arn : var.lambda_role_arn
}

output "lambda_role_name" {
  description = "The name of the IAM role created for the Lambda function"
  value       = var.create_role ? aws_iam_role.lambda[0].name : null
}

output "lambda_cloudwatch_log_group_name" {
  description = "The name of the CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.lambda.name
}

output "lambda_cloudwatch_log_group_arn" {
  description = "The ARN of the CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.lambda.arn
}

output "lambda_function_url" {
  description = "The HTTP URL endpoint for the Lambda function"
  value       = var.create_function_url ? aws_lambda_function_url.this[0].function_url : null
}

output "lambda_function_url_id" {
  description = "The Lambda Function URL generated id"
  value       = var.create_function_url ? aws_lambda_function_url.this[0].url_id : null
}

output "lambda_aliases" {
  description = "Map of Lambda aliases created"
  value = {
    for k, v in aws_lambda_alias.this : k => {
      arn             = v.arn
      invoke_arn      = v.invoke_arn
      function_version = v.function_version
    }
  }
}

