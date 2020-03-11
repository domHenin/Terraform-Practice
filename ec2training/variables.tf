# Region Variable
variable "aws_region" {
  description = "regional variable"
  default     = "us-east-2"
}

# Debian AMI Owner Variable
variable "deb_owner" {
  type        = string
  description = "owner of the debian ami"
  default     = "379101102735"
}

# Instance Port Variable
variable "instance_port" {
  description = "instnace port variable"
  default     = 8000
}

# Instance Protocol Variable
variable "instance_protocol" {
  description = "instance portocol variable"
  default     = "http"
}

# Elastic Load Balancing Name Variable
variable "container_name" {
  description = "Elastic Load Balancing Naming Variable"
  default     = "container-elb"
}

# Load Balance Port Variable
variable "lb_port" {
  description = "load balance port variable"
  default     = "443"
}

# Load Balance Protocol Variable
variable "lb_protocol" {
  description = "load balance protocol variable"
  default     = "https"
}