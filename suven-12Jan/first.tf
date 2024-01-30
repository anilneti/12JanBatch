provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "dev"{
    ami = "ami-0d3f444bc76de0a79"
    instance_type = var.instance_type
    tags = {
      Name = "DEV SERVER"
  }
  #count = 15
}

resource "aws_eip" "test"{
  domain = "vpc"
}

output "public_ip"{
  value = aws_eip.test.public_ip
}


/*resource "aws_instance" "app"{
    ami = "ami-0d3f444bc76de0a79"
    instance_type = "t2.small"
}*/

