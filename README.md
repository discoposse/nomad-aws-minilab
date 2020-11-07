# Nomad AWS Mini-Lab

Small-scale HashiCorp Nomad running across AWS EC2 instances for quick testing and tear down.

## What's In Here?

The Nomad AWS Mini-Lab is comprised of:

* Create new IAM for Nomad Lab
* Set up new VPC
* Create 3 public subnets
* Create Security Groups for ingress and egress
* Create an Internet Gateway
* Create a Routing Table and Subnet Associations
* 3 EC2 instances by default spread across 3 availability zones (adjustable)

# Nomad AWS Mini Lab

Small-scale HashiCorp Nomad running across AWS EC2 instances for quick testing and tear down.


## Why does this exist?

Setting up Nomad for occasional use on AWS does have some different deploument patterns.  Using the official CloudFormation template is robust (and pricey for a temporary lab).  What is needed is a way of making sure you have all the dependencies, policies, networks, and more.  It's also easy to leave behind a lot of remnants in AWS which are either costly or confusing (e.g. empty policies, unused subnets)

## Requirements

You will need:
* AWS IAM credentials - currently using root credentials (which is not ideal)
* Terraform Cloud our Terraform Enterprise account

## About the Lab Code

Terraform configuration built for Terraform 0.13.4 or higher

## What Does the Nomad Mini-Lab Build?

The lab does the following which is also completely removed when you do a deprovision/destroy so you have no unnecessary remnants left behind:

* Create new IAM for Nomad Lab
* Set up new VPC
* Create 3 public subnets
* Create 3 private subnets
* Create Security Groups for ingress and egress
* Create an Internet Gateway
* Create a Routing Table and Subnet Associations
* Create an EKS Cluster
* Create an EKS Node Group

## Variables Needed for Terraform

You will need to have the following defined in your Terraform configuration. This was built using Terraform Cloud and Terraform Enterprise so the description 

| Variable  | Type | Content |
| ------------- | ------------- | ------------- |
| aws_access_key | sensitive | Your AWS programmatic API key |
| aws_secret_key | sensitive | Your AWS API secret key |
| aws_region | standard | Region to launch in (e.g. us-east-2) |
| aws_key_name | text | Display name of your SSH key in AWS |
| aws_key_fingerprint | text | SSH key fingerprint (hex format) from AWS |
| nomad_node_instance_size | text | AWS instance family type (e.g. t3.small) |
| allowed_ip_network | HCL | Ingress networks for http/https/ssh using HCL format (e.g. ["0.0.0.0/0","10.0.0.0/16"] |
| nomad_node_count | numeric | How many nodes do you want in the cluster |

## Terraform Cloud Settings / Preferences

This was built using a VCS-backed configuration using GitHub using the very repository you're forking this from. 

## What's Missing?

This is work in progress. More is being done for the automatic clustering setup and deployment scripts/processes for both Nomad and Consul which will help this be much more self-starting. As of now this builds all the underlayers and deploys the code. You will only need to configure your Nomad and Consul...which should be fixed for automation shortly! (EW - 10/14/2020)

