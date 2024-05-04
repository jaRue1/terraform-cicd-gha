terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.47.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-state-bucket-gha-2024"
    key            = "staging/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-table-gha-2024"
    encrypt        = true
  }
}
resource "aws_s3_bucket" "example" {
  bucket = "my-staging-test-bucket-gha-2024"
}

module "staging-lambda" {
  source        = "../../core/hw-lambda"
  handler       = "lambda.handler"
  runtime       = "nodejs16.x"
  environment   = "staging"
  function_name = "staging-lambda"
  filename      = "../../core/hw-lambda/function/lambda.zip"
  source_code_hash = filebase64sha256("../../core/hw-lambda/function/lambda.zip")
  environment_variables = {
   LAMBDA_ENVIRONMENT = "staging"
   LAMBDA_MESSAGE = "Hello World from Staging!"
  }
}
