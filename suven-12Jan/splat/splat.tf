provider "aws" {
  region     = "ap-south-1"
}

resource "aws_iam_user" "myuser"{
    name = "iamuser.${count.index}"
    count = 3
}

output "arns" {
    value = aws_iam_user.myuser[*].arn
}

