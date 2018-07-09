variable "most_recent" {
  default = "true"
  description = "boolean, maps to `most_recent` parameter for `aws_ami` data source. If more than one result is returned, use the most recent AMI."
}

variable "release" {
  default     = "16.04"
  description = "default ubuntu release to target"
}

variable "name_map" {
  type = "map"
  default = {
    "17.10" = "artful"
    "17.04" = "zesty"
    "16.04" = "xenial"
    "14.04" = "trusty"
  }
  description = "map of release numbers to names, including trusty, xenial, zesty, and artful"
}