resource "aws_subnet" "main" {
  count = "${length(var.cidr_blocks)}"
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.cidr_blocks[count.index]}"
  tags {
    Name = "${var.name_prefix}-${format("%02d", count.index)}"
  }
  map_public_ip_on_launch = "${var.public}"
}


