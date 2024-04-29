module "production-lambda" {
  source        = "../../core/hw-lambda"
  handler       = "lambda.handler"
  runtime       = "nodejs16.x"
  environment   = "production"
  function_name = "production-lambda"
  filename      = "../../core/hw-lambda/function/lambda.zip"
  source_code_hash = filebase64sha256("../../core/hw-lambda/function/lambda.zip")
  environment_variables = {
   LAMBDA_ENVIRONMENT = "production"
   LAMBDA_MESSAGE = "Hello World from Production!"
  }
}
