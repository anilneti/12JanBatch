provider "aws" {
  region     = "ap-south-1"
}

resource "aws_security_group" "allow_ssh_1" {
  name        = "allow_ssh_1"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "myec2" {
   ami = "ami-01a4f99c4ac11b03c"
   instance_type = "t2.micro"
   key_name = "terraform-new"
   vpc_security_group_ids  = [aws_security_group.allow_ssh_1.id]

   provisioner "remote-exec" {
     inline = [
       "sudo yum -y install nano"
     ]
   }
   provisioner "remote-exec" {
       when    = destroy
       inline = [
         "sudo yum -y remove nano"
       ]
     }
   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = file("./terraform-new.pem")
     host = self.public_ip
   }
}