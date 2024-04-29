# 2 ----------------------------------------------------
# uncaomment this and migrate state to s3 and DynamoDB
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags = {
    Name = var.bucket_tag_name
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_dynamodb_table" "this" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = var.table_tag_name
  }
}

