terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" # Use the version you want
    }
  }
  backend "s3" {
    bucket         = "my-tf-state-bucket-pratik"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-south-1"
}
#comment because why not
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-concourse-terraform-bucket-using-concourse"

  tags = {
    Name        = "MyConcourseBucket"
    Environment = "Dev"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
