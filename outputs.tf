output "vpc_id" {
  value = aws_vpc.main.id
}

output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}

output "website_url" {
  description = "Public web server URL"
  value       = "http://${aws_instance.web.public_ip}"
}

output "s3_bucket_name" {
  value = aws_s3_bucket.app_data.bucket
}
