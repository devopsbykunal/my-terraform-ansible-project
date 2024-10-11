provider "aws" {
  region = "eu-north-1" # Change to your preferred AWS region
}

# Security Group that allows SSH and all outbound traffic
resource "aws_security_group" "allow_all_traffic" {
  name        = "allow_all_traffic"
  description = "Security group to allow SSH inbound and all outbound traffic"

  # Allow SSH (port 22) from any IP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all_traffic"
  }
}

# Dev Servers (2 instances)
resource "aws_instance" "dev_server" {
  count         = 2
  ami           = "ami-097c5c21a18dc59ea" # Example AMI
  instance_type = "t3.micro"
  key_name      = "jenkins_kunal" # Your key pair for SSH access
  security_groups = [aws_security_group.allow_all_traffic.name]  # Attach the security group

  tags = {
    Name = "DevServer-${count.index + 1}"
  }
}

# Test Servers (2 instances)
resource "aws_instance" "test_server" {
  count         = 2
  ami           = "ami-097c5c21a18dc59ea" # Example AMI
  instance_type = "t3.micro"
  key_name      = "jenkins_kunal" # Your key pair for SSH access
  security_groups = [aws_security_group.allow_all_traffic.name]  # Attach the security group

  tags = {
    Name = "TestServer-${count.index + 1}"
  }
}

# Nexus Server (1 instance)
resource "aws_instance" "nexus_server" {
  ami           = "ami-097c5c21a18dc59ea" # Example AMI
  instance_type = "t3.micro"
  key_name      = "jenkins_kunal" # Your key pair for SSH access
  security_groups = [aws_security_group.allow_all_traffic.name]  # Attach the security group

  tags = {
    Name = "NexusServer"
  }
}
