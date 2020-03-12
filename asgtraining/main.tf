# Provider
provider "aws" {
  version = ">= 2.46.0"
  region  = var.aws_region
}

# S3 Remote Bucket
terraform {
  backend "s3" {
    bucket = "cloudlogixtrtfstate"
    key    = "asgtraining/terraform.tfstate"
    region = "us-east-2"
  }
}

# Create AWS Key Pair
resource "aws_key_pair" "deployer" {
  key_name   = "provision_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Data AMI
data "aws_ami" "debian" {
  owners      = ["379101102735"]
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-stretch-hvm-*"]
  }
}

# ASG Launch Configuration
resource "aws_launch_configuration" "as_config" {
  name          = "debian_config"
  image_id      = data.aws_ami.debian.id
  instance_type = "t2.micro"

  user_data = file("files/install_nginx.sh")

  lifecycle {
    create_before_destroy = true
  }
}

# AWS Autoscalling Group
resource "aws_autoscaling_group" "as_group" {
  name                 = "asg-debian"
  launch_configuration = aws_launch_configuration.as_config.name
  min_size             = 2
  max_size             = 2

  lifecycle {
    create_before_destroy = true
  }
}

# ASG Load Balancer Attachment
resource "aws_autoscaling_attachment" "as_group" {
  autoscaling_group_name = aws_autoscaling_group.as_group.id
  elb                    = aws_elb.container_elb.id
}

# Elastic Load Balancer
resource "aws_elb" "container_elb" {
  name = "container-elb"

  listener {
    instance_port     = var.lb_port
    instance_protocol = var.lb_protocol
    lb_port           = var.lb_port
    lb_protocol       = var.lb_protocol
  }
}