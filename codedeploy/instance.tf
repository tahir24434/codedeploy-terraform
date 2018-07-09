provider "aws" {
  region = "${var.region}"
}

module "ubuntu-zesty-ami" {
  source  = "../../modules/ami-ubuntu"
  release = "17.04"
}

module "vpc" {
  source      = "../../modules/vpc"
  cidr_block  = "${var.vpc_cidr_block}"
  region      = "${var.region}"
  name_prefix = "${var.name_prefix}"
}

data "aws_availability_zones" "available" {}

module "public_subnet" {
  source      = "../../modules/subnets"
  vpc_id      = "${module.vpc.vpc_id}"
  cidr_blocks = "${var.public_subnet_cidrs}"
  name_prefix = "${var.name_prefix}"
}

resource "aws_instance" "this" {
  count         = "${length(var.public_subnet_cidrs)}"
  ami           = "${module.ubuntu-zesty-ami.id}"
  subnet_id     = "${element(module.public_subnet.ids, count.index)}"
  instance_type = "${var.instance_type}"
  key_name      = "${aws_key_pair.this.key_name}"
  associate_public_ip_address = true
  iam_instance_profile = "${aws_iam_instance_profile.main.name}"

  tags {
    Name = "CodeDeployDemo"
  }

  provisioner "remote-exec" {
    script = "./install_codedeploy_agent.sh"

    connection {
      agent       = false
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file(var.private_key_path)}"
    }
  }
}
