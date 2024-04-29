# need to setup s3 bucket for remote state and dynamodb for locking state
variable "region" {}
variable "bucket_name" {}
variable "bucket_tag_name" {}
variable "table_name" {}
variable "table_tag_name" {}


provider "aws" {
  region = var.region # be sure this region matches the region used in the github actions
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
  bucket_name     = var.bucket_name
  bucket_tag_name = var.bucket_tag_name
  table_name      = var.table_name
  table_tag_name  = var.table_tag_name
}
