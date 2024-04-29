variable "function_name" {
  type    = string
}


variable "environment" {
  type = string
}

variable "handler" {
  description = "The function entrypoint in your code."
  type        = string
}

variable "runtime" {
  description = "The identifier of the function's runtime."
  type        = string
}

variable "source_code_hash" {
  description = "Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key."
  type        = string
}

variable "filename" {
  description = "The path to the function's deployment package within the local filesystem."
  type        = string
}

variable "environment_variables" {
  description = "A map that defines environment variables for the Lambda function."
  type        = map(string)
}