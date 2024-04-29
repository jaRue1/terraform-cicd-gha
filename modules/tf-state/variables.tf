variable "bucket_name" {
  description = "CI Remote S3 Bucket Name"
  type        = string
  validation {
    condition     = can(regex("^([a-z0-9]{1}[a-z0-9-]{1,61}[a-z0-9]{1})$", var.bucket_name))
    error_message = "Bucket Name must not be empty and must follow S3 naming rules."
  }
}

variable "bucket_tag_name" {
  description = "CI Remote S3 Bucket Tag Name"
  type        = string
}

variable "table_name" {
  description = "CI Remote DynamoDB Table Name"
  type        = string
}

variable "table_tag_name" {
  description = "CI Remote DynamoDB Table Name Tag Name"
  type        = string
}
