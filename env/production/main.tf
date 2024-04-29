terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-gha-2024"
    key            = "production/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-table-gha-2024"
    encrypt        = true
  }
}


# module "production-lambda" {
#   source        = "../../core/hw-lambda"
#   handler       = "lambda.handler"
#   runtime       = "nodejs16.x"
#   environment   = "production"
#   function_name = "production-lambda"
#   filename      = "../../core/hw-lambda/function/lambda.zip"
#   source_code_hash = filebase64sha256("../../core/hw-lambda/function/lambda.zip")
#   environment_variables = {
#    LAMBDA_ENVIRONMENT = "production"
#    LAMBDA_MESSAGE = "Hello World from Production!"
#   }
# }
