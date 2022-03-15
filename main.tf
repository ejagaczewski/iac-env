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
  access_key = "AKIAR2MD646566I4XN7Y"
  secret_key = "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"
    default_tags {
    tags = {
      Environment = "Ed IaC Lab Tag"
      Name        = "Ed Wiz IaC Lab"
    }
    }
}