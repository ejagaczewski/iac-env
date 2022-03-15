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

#Create VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
#Create Subnet
resource "aws_subnet" "main" {
    vpc_id      = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
}