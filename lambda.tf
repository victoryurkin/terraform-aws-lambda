resource "aws_cloudfront_origin_access_identity" "default" {
  comment = "main"
}

resource "aws_lambda_function" "default" {
  function_name    = var.function_name
  handler          = var.handler
  runtime          = var.runtime
  role             = var.role
  filename         = var.filename
  source_code_hash = var.source_code_hash

  tags = local.base_tags
}
