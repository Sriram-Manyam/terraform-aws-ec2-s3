output "vpc_id" {
  description = "ID of the new VPC"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "ID of the new public subnet"
  value       = aws_subnet.public.id
}

output "security_group_id" {
  description = "ID of the Apache2 security group"
  value       = aws_security_group.apache.id
}

output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.apache_server.id
}

output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.apache_server.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.apache_server.public_dns
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.training_bucket.bucket
}

output "s3_bucket_arn" {
  description = "S3 bucket ARN"
  value       = aws_s3_bucket.training_bucket.arn
}
