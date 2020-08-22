variable "aws_access_key" {
	description = "Access key for AWS account"
}

variable "aws_secret_key" {
	description = "Secret for AWS account"
}

variable "aws_region" {
	description = "The region name to deploy into"
}

variable "aws_vpc_id" {
	description = "VPC ID to launch into"
}

variable "aws_key_fingerprint" {
	description = "Fingrprint of your SSH key"
}

variable "aws_key_name" {
	description = "SSH key name"
}

variable "nomad_node_instance_size" {
	description = "EC2 instance type/size for Nomad nodes"
}

variable "nomad_node_ami_id" {
	description = "AMI ID to use for Nomad nodes"
}

variable "aws_subnet_id" {
	description = "Default subnet to launch our nodes into"
	type = list(string)
	default = ["subnet-07d8310503d3d9704","subnet-091d4411443e82465","subnet-07d8310503d3d9704"]
}

variable "nomad_node_count" {
  description = "The number of server nodes (should be 3 or 5)"
  type        = number
}