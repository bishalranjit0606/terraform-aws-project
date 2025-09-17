variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Prefix for resource names"
  type        = string
  default     = "tf-demo"
}

variable "allowed_ssh_cidr" {
  description = "Your IP for SSH access (format: x.x.x.x/32)"
  type        = string
  default     = "0.0.0.0/0" 
}

