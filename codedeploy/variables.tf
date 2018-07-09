variable "instances_count" {
  type        = "string"
  description = "Number of instances in deployment"
  default     = "3"
}

variable "instance_type" {
  description = "The instance type"
  default     = "t2.micro"
}

variable "public_key_path" {
  description = "Path to a public ssh key"
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_key_path" {
  description = "Path to a private ssh key"
  default     = "~/.ssh/id_rsa"
}

variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "name_prefix" {
  description = "Name to prefix with resources"
}

variable "vpc_cidr_block" {
  description = "CIDR range of VPC. eg: 10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type        = "list"
  description = "A list of public subnet CIDRs to deploy inside the VPC."
}

variable "deployment_group_name" {
  description = "The name of the deployment group"
}
