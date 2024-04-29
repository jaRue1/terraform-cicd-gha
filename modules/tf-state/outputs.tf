output "s3_arn" {
  value = aws_s3_bucket.this.arn
}

output "s3_versioning" {
  value = aws_s3_bucket_versioning.this.bucket
}

output "codebuild_dynamodb_table_arn" {
  value = aws_dynamodb_table.this.arn
}
