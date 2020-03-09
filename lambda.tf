resource "aws_iam_role" "role" {
  name = var.role_name
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
  tags = merge(
    {
      "Name" = format("%s", var.role_name)
    },
    local.base_tags
  )
}

resource "aws_iam_role_policy" "policy" {
  count = length(var.role_policy_name) > 0 ? 1 : 0

  name = var.role_policy_name
  role = aws_iam_role.role[0].id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": ${var.role_statements}
}
EOF
}

resource "aws_lambda_function" "default" {
  function_name    = var.function_name
  handler          = var.handler
  runtime          = var.runtime
  role             = aws_iam_role.role.arn

  filename         = data.archive_file.lambda_zip_inline.output_path
  source_code_hash = data.archive_file.lambda_zip_inline.output_base64sha256

  tags = merge(
    {
      "Name" = format("%s", var.function_name)
    },
    local.base_tags
  )
}
