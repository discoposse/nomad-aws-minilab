variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "aws_vpc_id" {}
variable "aws_key_fingerprint" {}
variable "aws_key_name" {}
variable "nomad_node_instance_size" {}
variable "nomad_node_ami_id" {}
variable "aws_subnet_id" {
	default = "subnet-07d8310503d3d9704"
}