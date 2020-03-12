# AWS Region Variable
variable "aws_region" {
  description = "region for provider"
  default     = "us-east-2"
}

# ELB Listener Port
variable "lb_port" {
  description = "variable for the ELB Listener Port"
  default     = "80"
}

# ELB Listener Protocol
variable "lb_protocol" {
  description = "variable for the ELB Listener Protocol"
  default     = "http"
}