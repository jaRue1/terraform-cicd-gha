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

module "tf-state" {
  source          = "../modules/tf-state"
  bucket_name     = "terraform-state-bucket-gha-2024"
  bucket_tag_name = "terraform-state-bucket-gha-2024-tag"
  table_name      = "terraform-state-lock-table-gha-2024"
  table_tag_name  = "terraform-state-lock-table-gha-2024-tag"
}
