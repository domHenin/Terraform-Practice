# AWS Provider
// provider "aws" {
//     version = ">= 2.46.0"
//     region = "us-east-2"
// }

# Lambda Function Build
resource "aws_lambda_function" "lbd_function" {
  function_name = "ServerlessExample"

  s3_bucket = "serverless_example_terraform_bucket"
  s3_key    = "v1.0.0/example.zip"

  handler = "main.handler"
  runtime = "nodejs10.x"

  role = aws_iam_role.lambda_exec.arn
}

# IAM Role for the Lambda Access
resource "aws_iam_role" "lambda_exec" {
  name = "serverless_example_lambda"

  assume_role_policy = <<EOF
 {
   "Version": "2012-10-17",
   "Statement": [
     {
       "Action": "sts:AssumeRole",
       "Principal": {
         "Service": "lambda.amazonaws.com"
       },
       "Effect": "Allow",
       "Sid": ""
     }
   ]
 }
 EOF
}






