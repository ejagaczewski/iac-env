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
  access_key = "AKIAR2MD64656UHZYG7K"
  secret_key = "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"

    default_tags {
    tags = {
      Environment = "Ed IaC Lab Tag"
      Name        = "Ed Wiz IaC Lab"
    }
    }
}   