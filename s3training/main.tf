# AWS Provider
provider "aws" {
  version = ">= 2.46.0"
  region  = var.aws_region
}

# S3 Backend
terraform {
  backend "s3" {
    bucket = "cloudlogixtrtfstate"
    key    = "terraformpractice/terraform.tfstate"
    region = "us-east-2"
  }
}

# Create S3 Bucket
resource "aws_s3_bucket" "cloudlogixs3auto" {
  bucket = "s3bucket"
  region = var.aws_region
}

# Upload File to Bucket
resource "aws_s3_bucket_object" "hello-world-obj" {
    bucket = "s3bucket"
    key = "hello_world"
    source = "./files/hello_world.txt"
}