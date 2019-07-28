output "vpc_id" {
  value = "${aws_vpc.default.id}"
}
output "vpc_azs" {
    value = "${var.azs}"
}
output "ec2-centos-ip" {
  value = "${aws_instance.debian-docker.public_ip}"
}
