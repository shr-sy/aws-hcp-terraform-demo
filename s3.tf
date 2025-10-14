# Generate a random suffix for bucket name to ensure uniqueness
resource "random_id" "suffix" {
  byte_length = 4
}

# S3 Bucket
resource "aws_s3_bucket" "app_data" {
  bucket = "${var.project_name}-data-${random_id.suffix.hex}"

  tags = {
    Name = "${var.project_name}-bucket"
  }
}

# Block public access for security
resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.app_data.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Upload a demo HTML file using aws_s3_object
resource "aws_s3_object" "demo_file" {
  bucket  = aws_s3_bucket.app_data.id
  key     = "index.html"
  content = <<EOF
<h1>Hello from Terraform on AWS!</h1>
<p>This file is served from S3 bucket: ${aws_s3_bucket.app_data.bucket}</p>
EOF
  content_type = "text/html"
}
