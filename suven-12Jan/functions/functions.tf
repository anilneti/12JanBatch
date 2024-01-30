provider "aws" {
  region     = var.region
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "us-east-1"
}

/*variable "tags" {
  default = "webserver"
}*/

variable "ami" {
  type = map
  default = {
    "us-east-1"  = "ami-0323c3dd2da7fb37d"
    "us-west-2"  = "ami-0d6621c01e8c2de2c"
    "ap-south-1" = "ami-09ba48996007c8b50"
  }
}

#resource "aws_key_pair" "loginkey" {
# key_name   = "login-key"
#public_key = file("${path.module}/id_rsa.pub")
#}

resource "aws_instance" "webserver" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  #key_name = aws_key_pair.loginkey.key_name
  count = 2

  tags = {
    Name = "webserver-${count.index}"
  }
}

output "timestamp" {
  value = local.time
}