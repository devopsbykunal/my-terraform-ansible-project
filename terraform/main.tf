provider "aws" {
  region = "eu-north-1" # Change to your preferred region
}

resource "aws_instance" "dev_server" {
  count         = 2
  ami           = "ami-097c5c21a18dc59ea" # Use an appropriate AMI
  instance_type = "t3.micro"              # Choose instance type
  key_name      = "jenkins_kunal"         # Replace with your key pair

  tags = {
    Name = "DevServer-${count.index + 1}"
  }
}

resource "aws_instance" "test_server" {
  count         = 2
  ami           = "ami-097c5c21a18dc59ea" # Use the same or different AMI
  instance_type = "t3.micro"
  key_name      = "jenkins_kunal"

  tags = {
    Name = "TestServer-${count.index + 1}"
  }
}

resource "aws_instance" "nexus_server" {
  ami           = "ami-097c5c21a18dc59ea" # Use an appropriate AMI for Nexus
  instance_type = "t3.micro"
  key_name      = "jenkins_kunal"

  tags = {
    Name = "NexusServer"
  }
}
