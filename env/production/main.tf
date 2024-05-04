terraform {
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.47.0"
    }
  }
  # backend "s3" {
  #   bucket         = "your-bucket-name"
  #   key            = "production/terraform.tfstate"
  #   region         = "your-region"
  #   dynamodb_table = "your-table-name"
  #   encrypt        = true
  # }
}

