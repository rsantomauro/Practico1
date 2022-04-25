resource "aws_vpc" "Grupo7" {
  cidr_block = "${var.cidr_block}.0.0/16"
}

resource "aws_internet_gateway" "Grupo7" {
  // llama el id para crearlo o llamarlo del vpc
 vpc_id =  aws_vpc.Grupo7.id
}

resource "aws_subnet" "Grupo7-az1" {
  vpc_id = aws_vpc.Grupo7.id
  cidr_block = "${var.cidr_block}.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_security_group" "Grupo7-SG" {
  name = "Grupo7-SG"
  vpc_id = aws_vpc.Grupo7.id
  ingress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Grupo7"
    from_port = 22
    protocol = "-1"
    to_port = 22
  } ]
  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Grupo7"
    protocol = "-1"
  } ]
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