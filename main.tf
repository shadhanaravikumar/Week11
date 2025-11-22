resource "aws_security_group" "web_sg" {
  name        = "web-security-group"
  description = "Specific security group"
  vpc_id      = "vpc-1234567890abcdef" # replace with your real VPC ID

  ingress {
    description = "Allow only internal subnet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    # Specific CIDR instead of 0.0.0.0/0
    cidr_blocks = ["10.0.1.0/24"]
  }

  egress {
    description = "Allow only internal outbound traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

    # Again, no 0.0.0.0/0
    cidr_blocks = ["10.0.1.0/24"]
  }

  tags = {
    Name = "web-sg"
  }
}
