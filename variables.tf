variable "project_name" {
  type        = string
  description = "Project name prefix for resources"
  default     = "terraform-demo"
}

variable "aws_region" {
  type        = string
  description = "AWS region to deploy"
  default     = "ap-south-1"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.micro"
}
