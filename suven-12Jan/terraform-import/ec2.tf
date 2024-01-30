resource "aws_instance" "web" {
  ami           = "ami-0376ec8eacdf70aae"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-05cdab30aaf083407"]
  key_name = "terraform"

  tags = {
    Name = "ec2-terraform"
  }
}