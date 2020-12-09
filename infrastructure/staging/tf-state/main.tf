provider aws {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "terraform-state-bucket" {
  bucket = "tf-state-bucket-my-new-app-19110293"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    "Name" = "S3 Terraform state bucket"
  }
}