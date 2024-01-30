  provider "aws" {
     region     = "ap-south-1"
  }

  resource "aws_instance" "myec2"{
      ami = "ami-0ded8326293d3201b"
      instance_type = "t2.micro"

      provisioner "local-exec" {
          command = "echo ${aws_instance.myec2.private_ip} > ips.txt"
      }
      
  }