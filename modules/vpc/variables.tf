variable "name_prefix" {
  description = "Name to prefix the VPC/DHCP resources with"
}

variable "region" {
  description = "Region were VPC will be created"
}

variable "cidr_block" {
  description = "CIDR range of VPC. eg: 172.16.0.0/16"
}

variable "extra_tags" {
  type = "map"
  description = "Extra tags that will be added to VPC and DHCP resources"
  default     = {}
}

variable "enable_dns_hostnames" {
  default     = true
  description = "boolean, enable/disable VPC attribute, enable_dns_hostnames"
}

variable "enable_dns_support" {
  default     = true
  description = "boolean, enable/disable VPC attribute, enable_dns_support"
}
