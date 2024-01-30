provider "aws" {
  region     = "ap-south-1"
  access_key ="AKIAY5P26JJ7IZ4WGYUT"
  secret_key = "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"
}


/*
resource "aws_instance" "dev" {
  ami           = "ami-067c21fb1979f0b27"
  instance_type = "t2.micro"
  # count = 4
}*/