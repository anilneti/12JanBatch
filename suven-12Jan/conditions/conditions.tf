provider "aws" {
  region     = "ap-south-1"
}

variable "istest"{}

#variable "abc"{}

resource "aws_instance" "dev"{
    ami = "ami-01a4f99c4ac11b03c"
    instance_type = "t2.micro"
    count = var.istest == true ? 1 : 0
}

resource "aws_instance" "prod"{
    ami = "ami-01a4f99c4ac11b03c"
    instance_type = "t2.large"
    count = var.istest == false ? 1 : 0    
}