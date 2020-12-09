provider "aws" {
  region     = "eu-west-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "tf-state-bucket-my-new-app-19110293"
    key     = "terraform.tfstate"
    region  = "eu-west-1"
  }
}
