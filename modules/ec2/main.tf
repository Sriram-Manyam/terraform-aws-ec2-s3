data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}

resource "aws_security_group" "apache" {
  name        = "terraform-apache-sg"
  description = "Security group for Terraform Apache server"
  vpc_id      = data.aws_subnet.selected.vpc_id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform-Apache-SG"
  }
}

resource "aws_instance" "apache_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id              = data.aws_subnet.selected.id
  vpc_security_group_ids = [aws_security_group.apache.id]

  user_data = <<-EOF
    #!/bin/bash

    dnf install -y httpd

    systemctl enable httpd
    systemctl start httpd

    echo "<h1>Apache Server created using Terraform</h1>" > /var/www/html/index.html
  EOF

  tags = {
    Name = var.instance_name
  }
}
