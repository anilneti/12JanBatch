provider "aws" {
  region     = "ap-south-1"
  
}

resource "aws_instance" "dev" {
  ami           = "ami-067c21fb1979f0b27"
  instance_type = "t2.micro"
}
