terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "jenkinsservers" {
  ami             = "ami-0df24e148fdb9f1d8"
  instance_type   = "t2.micro"
  key_name        = "Natalierose"
  security_groups = ["default"]
  user_data = file("jenkins.sh")

  tags = {
    Name = "Jenkinssserver-terraform"
  }
}
  resource "aws_security_group" "default" {
	tags = {
	type = "jenkins-security-group"
}
}
