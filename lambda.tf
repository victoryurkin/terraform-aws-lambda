resource "aws_cloudfront_origin_access_identity" "default" {
  comment = "main"
}

resource "aws_lambda_function" "default" {
  function_name    = var.function_name
  handler          = var.handler
  runtime          = var.runtime
  role             = var.role

  data "archive_file" "lambda_zip_inline" {
    type        = "zip"
    output_path = "lambda_zip_inline.zip"
    source {
      content  = <<EOF
exports.handler = async (event) => {
    // TODO implement
    const response = {
        statusCode: 200,
        body: JSON.stringify('Hello from Lambda!'),
    };
    return response;
};
EOF
      filename = "index.js"
    }
  }  

  filename         = data.archive_file.lambda_zip_inline.output_path
  source_code_hash = data.archive_file.lambda_zip_inline.output_base64sha256

  tags = local.base_tags
}
