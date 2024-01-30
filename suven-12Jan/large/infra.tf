provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "dev" {
  ami           = "ami-067c21fb1979f0b27"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }

  /*lifecycle {
    ignore_changes = [instance_type]
  }*/
}

resource "aws_instance" "qa" {
  ami           = "ami-067c21fb1979f0b27"
  instance_type = "t2.micro"

  tags = {
    Name = "Hello QA team"
  }
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  #vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    #cidr_blocks      = [aws_vpc.main.cidr_block]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_user" "lb1" {
  name = "loadbalancer1"
  path = "/system/"

  tags = {
    tag-key = "tag-value1"
  }
}

resource "aws_iam_user" "lb2" {
  name = "loadbalancer2"
  path = "/system/"

  tags = {
    tag-key = "tag-value2"
  }
}

resource "aws_iam_user" "lb3" {
  name = "loadbalancer3"
  path = "/system/"

  tags = {
    tag-key = "tag-value3"
  }
}


resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.lb.name
}

data "aws_iam_policy_document" "lb_ro" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "lb_ro" {
  name   = "test"
  user   = aws_iam_user.lb.name
  policy = data.aws_iam_policy_document.lb_ro.json
}

