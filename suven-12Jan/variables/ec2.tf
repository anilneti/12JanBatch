provider "aws" {
  region     = "ap-south-1"
}

/*
resource "aws_instance" "anil" {
  ami           = "ami-0b9ecf71fe947bbdd"
  instance_type = var.imagetype
  #instance_type = "t2.micro"
  #count = 5
}
*/



resource "aws_iam_user" "test" {
  name = var.username
  # path = "/home/anil"
}
