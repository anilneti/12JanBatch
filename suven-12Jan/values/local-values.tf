provider "aws" {
  region     = "ap-south-1"
}

locals {
    common_tags = {
        Owner = "DevOps Team"
        service = "database"
    }
}

resource "aws_instance" "db-dev"{
    ami = "ami-01a4f99c4ac11b03c"
    instance_type = "t2.micro"
    tags = local.common_tags
}

resource "aws_ebs_volume" "db_ebs" {
    availability_zone = "ap-south-1a"
    size = 8
    tags = local.common_tags
}