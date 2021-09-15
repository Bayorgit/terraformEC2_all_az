#terraform block
terraform {
  required_version = "~> 1.0.6" # which means any version equal & above 1.0.6 like 1.0.7, 1.0.8 etc and < 1.xx
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  } 
}  
#Provider Block
# provider "aws" {
#   region = "us-east-1"
# }

/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/