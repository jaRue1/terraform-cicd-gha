terraform {
  backend "local" {}
}
module "staging-lambda" {
  source           = "../../core/hw-lambda"
  handler          = "lambda.handler"
  runtime          = "nodejs16.x"
  environment      = "staging"
  function_name    = "staging-lambda"
  filename         = "../../core/hw-lambda/function/lambda.zip"
  source_code_hash = filebase64sha256("../../core/hw-lambda/function/lambda.zip")
  environment_variables = {
    LAMBDA_ENVIRONMENT = "staging"
    LAMBDA_MESSAGE     = "Hello World from Staging!"
  }
}


resource "aws_s3_bucket" "staging-bucket" {
  bucket = "staging-bucket-1234567890-github-actions"
  tags = {
    Environment = "staging"
  }
}
