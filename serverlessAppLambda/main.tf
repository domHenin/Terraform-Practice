provider "aws" {
  version = ">= 2.46.0"
  region  = "us-east-2"
}

# Backend S3
// terraform {
//     backend "s3" {

//     }
// }

# Create Bucket
resource "aws_s3_bucket" "serverless_bucket" {
  bucket = "serverless_example_terraform_bucket"
  acl    = "private"
}

# Upload .zip to Bucket
resource "aws_s3_bucket_object" "object" {
  bucket = "serverless_example_terraform_bucket/v1.0.0/example.zip"
  key    = "hello_world"
  source = "example.zip"
}