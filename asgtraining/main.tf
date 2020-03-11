# Provider
provider "aws" {
    version = ">= 2.46.0"
    region = var.aws_region
}

# S3 Remote Bucket
terraform {
    backend "s3" {
        bucket = 
        key    =
        region = us-east-2
    }
}

# Create AWS Key Pair
resource "aws_key_pair" "deployer" {
    key_name = "provision_key"
    public_key = file("~/.ssh/id_rsa.pub")
}

# Data AMI
data "aws_ami" "debian" {
    owners = ["379101102735"]
    most_recent = true

    filer {
        name = "name"
        values = ["debian-stretch-hvm-*"]
    }
}

# ASG Launch Configuration

# AWS Autoscalling Group

# Elastic Load Balancer

# ELB Attachement