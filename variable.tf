
//REGION
variable "region_to_deploy" {
  description = "The region of the project deployment"
  type = string
}

variable "env" {
  description = "Deployment environment"
  type        = string
}

variable "resource_alias" {
  description = "Resource creator name"
  type        = string
}

variable "instance_key_tag" {
  description = "tag of the ssh key"
  type = string
}

variable "dev_bucket_name" {
  description = "name of the bucket"
  type = string
}

variable "k0s_instance_name_tag" {
  description = "name of the the k0s instance"
  type = string
}

variable "jenkins_instance_name_tag" {
  description = "name of the jenkins instance"
  type = string
}


//VPC VARS
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

