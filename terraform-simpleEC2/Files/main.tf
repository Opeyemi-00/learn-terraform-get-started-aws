provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0971f6afca696ace6"
  instance_type = "t3.micro"


  tags = {
    Name = "MyEC2"

  }
}