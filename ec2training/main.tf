# AWS Provider
provider "aws" {
  version = ">= 2.46.0"
  region  = var.aws_region
}

# S3 Backend
terraform {
  backend "s3" {
    bucket = "cloudlogixtrtfstate"
    key    = "ec2training/terraform.tfstate"
    region = "us-east-2"
  }
}

# Key Pair
resource "aws_key_pair" "deployer" {
  key_name   = "provision_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# EC2 AMI
data "aws_ami" "deb_ami" {
  owners      = ["379101102735"]
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-stretch-hvm-*"]
  }
}

# EC2 Instance
resource "aws_instance" "deb_container" {
  key_name      = aws_key_pair.deployer.key_name
  count         = 2
  ami           = data.aws_ami.deb_ami.id
  instance_type = "t2.micro"

  connection {
    type        = "ssh"
    user        = "admin"
    private_key = file("~/.ssh/id_rsa")
    host        = self.publics_ip
  }

  user_data = file("files/install_nginx.sh")
}

# Create ELB
resource "aws_elb" "container_elb" {
  name = "container-elb"


  listener {
    instance_port     = var.instance_port
    instance_protocol = var.instance_protocol
    lb_port           = var.lb_port
    lb_protocol       = var.lb_protocol
  }
}

# Create ELB Attachment
resource "aws_elb_attachment" "elb_attachment" {
  elb      = aws_elb.container_elb.id
  instance = "aws_instance.deb_container.*.id"
}