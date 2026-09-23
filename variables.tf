variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be created"
  type        = string
  default     = "subnet-07eb6ebab11ff1570"
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
}
