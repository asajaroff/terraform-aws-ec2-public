
variable "namespace" {
  description = "Namespace for the application, e.g. 'product' or 'application'"
  default = "ns"
}
variable "application" {
  description = "Application name, e.g. 'app' or 'solution'"
  default = "app"
}
variable "owner" {
  description = "Owner of the Infrastructure, e.g. 'BusinessUnit'"
  default = ""
}
variable "environment" {
  description = "Environment name, e.g. 'testing' or 'production'"
  default = "testing"
}
variable "mantainer" {
  description = "Email of mantainer, e.g. 'you@email.com'"
}
variable "cidr_block" {
    description = "CIDR Block for the VPC."
}
variable "aws_region" {
  default = "us-east-1"
}
variable "azs" {
    default = []
    description = "List of availability zones."
}
variable "key_pair_name" {
  description = "EC2 Key Pair for SSH access."
}
variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
}
variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.1.0/24"
}
