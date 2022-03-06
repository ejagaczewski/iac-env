resource "aws_instance" "foo" {
  ami           = "ami-0c4fd3942aeff4f9e" # us-west-2
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main.id
}