terraform {
  backend "s3" {
    bucket         = "naveed-tf-state-unique-12345"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t3.micro"
  tags = { Name = "Terraform-EC2"
  }
}
