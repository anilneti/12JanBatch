provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAY5P26JJ7HCFDN3VF"
  secret_key = "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"
}

resource "aws_instance" "dev"{
    ami = "ami-01a4f99c4ac11b03c"
    instance_type = "t2.micro"
    key_name = "terraform-new"

    connection {
     type     = "ssh"
     user     = "ec2-user"
     private_key = file("./terraform-new.pem")
     host     = self.public_ip
    }

    provisioner "remote-exec" {
      inline = [
        "sudo amazon-linux-extras install -y nginx1",
        "sudo systemctl start nginx"
	   #"sudo systemctl start https"
      ]
    }
}

