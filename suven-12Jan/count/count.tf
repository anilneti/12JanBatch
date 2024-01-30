provider "aws" {
  region     = "ap-south-1"
}

## usage of variables for count/count.index
variable "elb_names" {
  type = list
  default =["dev-testuser","prod-testuser","qa-testuser"]
}

resource "aws_iam_user" "testuser" {
  name = var.elb_names[count.index]    ## used for creating using variables
  #name = "testuser"   ## used for creating same user with the count value
  #name = "testuser.${count.index}"  ## using count.index
  count = 3
}