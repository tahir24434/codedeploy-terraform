resource "aws_key_pair" "this" {
  key_name   = "id_rsa"
  public_key = "${file(var.public_key_path)}"
}
