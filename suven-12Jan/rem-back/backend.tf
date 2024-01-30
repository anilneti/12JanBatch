terraform {
  backend "s3" {
    bucket = "terraform-suven-weekend12"
    key    = "net/terraform.tfstate"
    region = "ap-south-1"
    #access_key = "AKIAY5P26JJ7BNEXKUHT"
    #secret_key = "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"
  }
}