output "ids" {
  value       = ["${aws_subnet.main.*.id}"]
  description = "List of subnet ids"
}

output "cidr_blocks" {
  value       = ["${aws_subnet.main.*.cidr_block}"]
  description = "CIDR blocks"
}

output "vpc_id" {
  value       = ["${var.vpc_id}"]
  description = "ID of the VPC the subnets are in"
}