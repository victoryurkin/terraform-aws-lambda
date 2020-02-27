resource "aws_cloudfront_origin_access_identity" "default" {
  comment = "main"
}

resource "aws_lambda" "default" {
  function_name = var.function_name
  
  tags = local.base_tags
}
