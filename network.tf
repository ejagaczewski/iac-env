#Create VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
#Create Subnet
resource "aws_subnet" "main" {
    vpc_id      = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
}