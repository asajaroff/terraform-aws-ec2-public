data "aws_ami" "debian-ami" {
  most_recent       = true
  owners            = ["679593333241"]
  filter {
    name   = "name"
    values = ["debian-stretch-hvm-x86_64-*"]
  }
}