
provider "aws" {
  region = var.region_to_deploy
}


//INSTANCES
resource "aws_instance" "jenkins" {
  ami = data.aws_ami.amazon_linux_ami.id
  instance_type = data.aws_ec2_instance_type_offering.ec2_instance_type.id
  key_name = data.aws_key_pair.web_server_key.key_name

  subnet_id = module.app_vpc.public_subnets[0]
  security_groups = [aws_security_group.jenkins_sg.id]

  tags = {
    Terraform = "true"
    Name = var.jenkins_instance_name_tag
    Creator = var.resource_alias
    Env = var.env
  }
}

resource "aws_instance" "k0s_server" {
  ami = data.aws_ami.amazon_linux_ami.id
  instance_type = data.aws_ec2_instance_type_offering.ec2_instance_type.id
  key_name = data.aws_key_pair.web_server_key.key_name

  subnet_id = module.app_vpc.public_subnets[0]
  security_groups = [aws_security_group.k0s_sg.id]

  tags = {
    Terraform = "true"
    Name = var.k0s_instance_name_tag
    Creator = var.resource_alias
    Env = var.env
  }
}

//S3 BUCKET
resource "aws_s3_bucket" "dev_bucket" {
  bucket = var.dev_bucket_name
  tags = {
    Terraform = "true"
    Creator = var.resource_alias
    Env = var.env
  }
}

resource "aws_s3_bucket_versioning" "dev_bucket_versioning" {
  bucket = aws_s3_bucket.dev_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

//SECURITY GROUPS

resource "aws_security_group" "jenkins_sg" {
  name = "jenkins-sg"
  vpc_id = module.app_vpc.vpc_id

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 8080
    protocol  = "tcp"
    to_port   = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "k0s_sg" {
  name = "k0s_sg"
  vpc_id = module.app_vpc.vpc_id

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  //DASHBOARD PORT
  ingress {
    from_port = 30001
    protocol  = "tcp"
    to_port   = 30001
    cidr_blocks = ["0.0.0.0/0"]
  }
  //API SERVER
  ingress {
    from_port = 6443
    protocol  = "tcp"
    to_port   = 6443
    cidr_blocks = ["0.0.0.0/0"]
  }
}