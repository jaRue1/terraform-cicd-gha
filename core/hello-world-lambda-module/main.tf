resource "aws_iam_role" "lambda_role" {
  name = "${var.environment}-lambda-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}
# CloudWatch Logs Permissions for Lambda
resource "aws_iam_policy" "lambda_logs_policy" {
  name        = "${var.environment}-lambda-logs-policy"
  description = "IAM policy for logging from a cron lambda"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "arn:aws:logs:*:*:*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_logs_policy.arn
}

resource "aws_lambda_function" "lambda" {
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime
  role          = aws_iam_role.lambda_role.arn

  filename         = var.filename
  source_code_hash = var.source_code_hash

  environment {
    variables = var.environment_variables
  }
}

