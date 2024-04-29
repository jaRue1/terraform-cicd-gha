resource "aws_s3_bucket" "hello_world_bucket" {
  bucket = "hello-world-bucket-gha-2024"
  tags = {
    name = "hello-world-bucket-gha-2024-tag"
  }
}