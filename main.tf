provider "aws" {
  region  = "us-west-2"
  access_key = "AKIASAZ7LQ3FFJQ3HKHN"
  secret_key = "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"
}

resource "aws_instance" "first_server" {
  ami           = "ami-0d70546e43a941d70"
  instance_type = "t2.micro"
  tags = {
    Name = "Udapeople"
  }
}
