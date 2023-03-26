
variable "env" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "resource_alias" {
  description = "Resource creator name"
  type        = string
  default     = ""
}

variable "instance_key_tag" {
  description = "tag of the ssh key"
  type = string
  default = ""
}

variable "dev_bucket_name" {
  description = "name of the bucket"
  type = string
  default = ""
}

variable "k0s_instance_name_tag" {
  description = "name of the the k0s instance"
  type = string
  default = ""
}

variable "jenkins_instance_name_tag" {
  description = "name of the jenkins instance"
  type = string
  default = ""
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