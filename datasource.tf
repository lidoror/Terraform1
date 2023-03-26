data "aws_ami" "amazon_linux_ami" {
  owners = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_ec2_instance_type_offering" "ec2_instance_type" {
  filter {
    name   = "instance-type"
    values = ["t2.micro", "t3.micro"]
  }
  preferred_instance_types = ["t2.micro", "t3.micro"]
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_key_pair" "web_server_key" {
  include_public_key = true

  filter {
    name   = "tag:Name"
    values = [var.instance_key_tag]
  }
}

data "aws_availability_zones" "available_azs_ids" {
  state = "available"
}