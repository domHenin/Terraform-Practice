# Configure AWS Provider
provider "aws" {
    region     = var.aws_region
    version    = ">= 2.46.0"
}

# S3 Bucket Remote State
terraform {
    backend "s3" {
        bucket = "cloudlogixtrtfstate"
        key = "lambdatraining/terraform.tfstate"
        region = "us-east-2"
    }
}


# Upload file to S3 Bucket
resource "aws_s3_bucket" "lambda_write_obj" {
    bucket = "s3bucket" 
    key = "hello_world"
    source = "./files/lambdaread.txt"
}

# IAM Role for Lambda
resource "aws_iam_role" "iam_lambda" {
    name = "iam_for_lambda"

    assume_role_policy = << EOF
  {
      "Version": ""
      "Statement": [
          {
              "Action": "sts:AssumeRole",
              "Principal": {
                  "Service": "lambda.amazonaws.com"
              },
              "Effect": "Allow",
              "Sid":
          }
      ]
  }
  EOF
}

# Create Lambda Function
resource "aws_lambda_function" "prod_lambda" {
    file
}