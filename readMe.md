# Terraform CICD



## Introduction

This project is a simple example of how to use Terraform to create a CI/CD pipeline in AWS. The pipeline will be triggered by a push to a GitHub repository, and will deploy a simple web application to an EC2 instance. 



## Prerequisites

- [An AWS account](https://portal.aws.amazon.com/billing/signup?p=free&c=hp&z=1#/start/email)
- [A GitHub account](https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github)
- [Git installed on your local machine](https://github.com/git-guides/install-git)
- AWS CLI installed on your local machine
  - Mac: [Here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions)
  - Windows: [Here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions)
  - Linux: [Here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions)
- [Terraform installed on your local machine](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)


## Getting Started
Repository Setup
1. Create a new GitHub repository
1. Clone this repository to your local machine
1. run the cmd `rm -rf .git` to remove the git history
1. run the cmd `git init` to initialize a new git repository
1. run the cmd `git add .` to add all files to the git repository
1. run the cmd `git commit -m "initial commit"` to commit the files
1. run the cmd `git remote add origin https://your-repo-url-here` to add the new repository as the remote origin
1. DO NOT push the code to the remote repository yet as the remote state resources have not been created


AWS Resources for Remote State
1. Cd Into the local directory
1. Create a terraform.tfvars file in the root of that directory
1. in the terraform.tfvars file, add the following variables:
```
region          = "your-region"
bucket_name     = "your-bucket-name"
bucket_tag_name = "your-bucket-tag-name"
table_name      = "your-table-name"
table_tag_name  = "your-table-tag-name"
```
1. Run `terraform init` to initialize the Terraform configuration
1. Run `terraform apply -auto-approve` to create the remote state resources in AWS


GitHub Secrets
1. In the GitHub repository, go to Settings > Secrets
1. Add the following secrets:
```
AWS_ACCESS_KEY_ID     = "your-access-key-id"
AWS_SECRET_ACCESS_KEY = "your-secret
REGION                = "your-region"
BUCKET_NAME           = "your-bucket-name"
STAGING_BUCKET_KEY    = "staging"
PRODUCTION_BUCKET_KEY = "production"
```


Configuring Env Folders
