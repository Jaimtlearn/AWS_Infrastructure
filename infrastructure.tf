provider "aws" {
  region = "us-east-1"  # Set your desired region here
}

resource "aws_instance" "instance_a" {
  ami           = "ami-12345678"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_a.id

  tags = {
    Name = "Instance A"
  }
}

resource "aws_instance" "instance_b" {
  ami           = "ami-12345678"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_b.id

  tags = {
    Name = "Instance B"
  }
}
#vpc creation

resource "aws_vpc" "example_vpc" {
  name = "vpctest"
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet_a" {
  name = "subnet_a"
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "subnet_b" {
  name = "subnet_b"
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}
