provider "aws" {
  region     = "ap-south-1"
}

variable "sg-ports"{
    type = list(number)
    description = "used for sg ports"
    default = [443,8080,4230,3400]
}

resource "aws_security_group" "dynamic_sg" {
  name        = "dynamic sg"
  description = "allow multiple ports"
  
  dynamic  "ingress" {
    for_each = var.sg-ports
    #iterator = port
    content {
        from_port = port.value
        to_port = port.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
 }
}