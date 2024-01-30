terraform {
  backend "s3" {
    bucket = "s3-oct-weekend"
    key    = "network/terraform.tfstate"
    region = "ap-south-1"
  }
}