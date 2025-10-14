data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = false

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y apache2 awscli
              systemctl enable apache2
              systemctl start apache2
              # Download index.html from S3 bucket
              aws s3 cp s3://${aws_s3_bucket.app_data.bucket}/index.html /var/www/html/index.html
              EOF

  tags = { Name = "${var.project_name}-ec2" }
}
