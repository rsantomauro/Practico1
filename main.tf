provider "aws" {
  region  = "us-east-1"
  profile = "default"
}
resource "aws_instance" "test-ec2" {
  ami           = "ami-03ededff12e34e59e"
  instance_type = "t2.micro"
  key_name      = "vockey"
  vpc_security_group_ids = ["sg-011ed1a174751c1f4"]
  tags = {
    Name      = "practico1"
    terraform = "True"

  }
}