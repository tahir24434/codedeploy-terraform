output "id" {
  value       = "${data.aws_ami.ubuntu.id}"
  description = "ID of the AMI"
}
