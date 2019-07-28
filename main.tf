provider "aws" {
    version = "~> 2.0"
    region  = "us-east-1"
}
locals {
  name = "${var.application}-${var.namespace}-${var.environment}"
  common_tags = {
  "Namespace"   = "${var.namespace}"
  "Environment" = "${var.environment}"
  "Application" = "${var.application}"
  "Mantainer"   = "${var.mantainer}"
  "Owner"       = "${var.owner}"
  }
}

  resource "aws_vpc" "default" {
  cidr_block         = "${var.cidr_block}"
  enable_dns_support = true
  assign_generated_ipv6_cidr_block = false
  tags          = "${merge(map(
    "Name", "${local.name}-vpc",
    ), local.common_tags)}"
}
resource "aws_instance" "debian-docker" {
  ami           = "${data.aws_ami.debian-ami.id}"
  security_groups = [ "${aws_security_group.web.id}" ]
  instance_type = "m4.large"
  key_name      = "${var.key_pair_name}"
  monitoring    = true
  subnet_id     = "${aws_subnet.public-subnet-az1.id}"
  tags          = "${merge(map(
  "Name", "${local.name}-instance",
  ), local.common_tags)}"
}

