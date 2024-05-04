provider "aws" {
  region = "us-east-1" # be sure this region matches the region used in the github actions
}

terraform {
  required_version = "~> 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# module "tf-state" {
#   source          = "../modules/tf-state"
#   bucket_name     = "your-bucket-name"
#   bucket_tag_name = "your-bucket-tag-name"
#   table_name      = "your-table-name"
#   table_tag_name  = "your-table-tag-name"
# }
