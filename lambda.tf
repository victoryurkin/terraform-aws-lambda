resource "aws_cloudfront_origin_access_identity" "default" {
  comment = "main"
}

resource "aws_lambda_function" "default" {
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime
  role_arn      = var.role_arn

  tags = local.base_tags
}
