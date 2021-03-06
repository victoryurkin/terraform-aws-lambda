output "this_function_uri" {
  description = "Lambda function URI"
  value       = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/${aws_lambda_function.default.arn}/invocations"
}

output "this_function_name" {
  description = "Lambda function Name"
  value       = aws_lambda_function.default.function_name
}
