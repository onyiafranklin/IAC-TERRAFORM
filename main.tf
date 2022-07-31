provider "aws" {
  region  = "us-east-1"
 
}

variable "my_instance_type" {
  type        = string
  description = "This shows the instance type"
}

resource "aws_vpc" "VPC" {
  cidr_block = "10.0.0.0/16"

  tags={
    Name= "production"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}

resource "aws_instance" "webserver" {
  ami = "ami-052efd3df9dad4825"
  instance_type = var.my_instance_type
  subnet_id = aws_subnet.subnet.id
 

  tags = {
    Name = "prod-webserver"
  }
}