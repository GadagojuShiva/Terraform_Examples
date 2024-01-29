# Terraform AWS EC2 Instance Module

This Terraform module deploys an AWS EC2 instance with customizable configurations. It is designed to be reusable and easily integrated into your infrastructure.

## Table of Contents
- [Terraform AWS EC2 Instance Module](#terraform-aws-ec2-instance-module)
  - [Table of Contents](#table-of-contents)
  - [About Terraform Modules](#about-terraform-modules)
  - [Module Features](#module-features)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
  - [Inputs](#inputs)
  - [Outputs](#outputs)

## About Terraform Modules
Terraform modules are a way to organize and reuse Terraform configurations. A module is a collection of Terraform files grouped together in a directory. It can include variable definitions, resource configurations, and output definitions. Modules allow you to encapsulate and share infrastructure code, promoting reusability and maintainability in your Terraform projects.
## Module Features
1. **Reusability:** Modules can be reused across different projects, promoting code consistency
2. **Encapsulation:** Modules encapsulate related resources and configurations, making it easier to understand and manage complex infrastructure
3. **Parameterization:** Modules support input variables, allowing users to customize the behavior of the module.
4. **Outputs:** Modules can define outputs that provide information about the resources created, enabling better integration with other parts of your infrastructure.
5. **Versioning:** Modules can be versioned, allowing for controlled updates and ensuring stability in different environments.
## Prerequisites
Before using this module, make sure you have the following prerequisites:
- Terraform installed
- AWS credentials configured
- Necessary variables defined (see [Inputs](#inputs))

## Usage
To use this module, include it in your Terraform configuration files. Here is an example:

```bash
provider "aws" {
    region = "us-east-1"
}

module "ec-module" {
    source            = "./module/ec-instance"
    aws_ami_id        = "ami-0c7217cdde317cfec"
    aws_instance_type = "t2.micro"
    aws_subnet_id     = "subnet-02a30bf97162df10b"
}
```
- Ensure that you update the values of `aws_ami_id`, `aws_instance_type`, and `aws_subnet_id` according to your requirements.

## Inputs
1. **aws_ami_id**: (*Required*) The AMI ID for the EC2  nstance.
2. **aws_instance_type**: (*Required*) The instance type for the EC2 instance.
3. **aws_subnet_id**: (*Required*) The ID of the subnet where the EC2 instance will be launched.
## Outputs
1. **public-ip:** The public IP address of the deployed EC2 instance.

<p style = text-aligin: center>Readme By <strong>GS</strong></p>