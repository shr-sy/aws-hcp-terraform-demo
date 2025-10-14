output "ec2_private_ip" {
  value = aws_instance.web.private_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.app_data.bucket
}
