resource "aws_instance" "test-ec2" {
  ami   = "ami-03ededff12e34e59e"
  name  = "practico1"
  
  tags {
    Name = "practico1"
  }
}