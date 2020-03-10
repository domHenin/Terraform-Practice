# Region Variable
variable "aws_region" {
    description = "regional variable"
    default = "us-east-2"
}

# Debian AMI Owner Variable
variable "deb_owner" {
    description = "owner of the debian ami"
    default = "379101102735"
}

# Instance Port Variable
variable "instance_port" {
    description = "instnace port variable"
    default = 8000
}

# Instance Protocol Variable
variable "instance_protocol