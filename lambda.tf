resource "aws_cloudfront_origin_access_identity" "default" {
  comment = "main"
}

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

resource "aws_iam_role" "front_end_config_role" {
  name = "front-end-config-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }
  ]
}
EOF
  tags = local.base_tags
}

resource "aws_lambda_function" "default" {
  function_name    = var.function_name
  handler          = var.handler
  runtime          = var.runtime
  role             = aws_iam_role.front_end_config_role.arn

  filename         = data.archive_file.lambda_zip_inline.output_path
  source_code_hash = data.archive_file.lambda_zip_inline.output_base64sha256

  tags = local.base_tags
}
