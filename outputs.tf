output "ec2_private_ip" {
  value = aws_instance.web.private_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.app_data.bucket
}

output "alb_url" {
  value       = aws_lb.web_alb.dns_name
  description = "Public URL to access the website via ALB"
}

