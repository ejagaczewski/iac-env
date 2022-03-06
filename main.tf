terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

#Configure AWS Provider
provider "aws" {
  region = "us-west-2"
  profile = "default"

    default_tags {
    tags = {
      Environment = "Ed IaC Lab Tag"
      Name        = "Ed Wiz IaC Lab"
    }
    }
}   