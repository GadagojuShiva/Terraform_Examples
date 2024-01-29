# Terraform Configuration for AWS EC2 Instance
This Terraform configuration automates the deployment of an AWS EC2 instance, providing a flexible and scalable solution. Below, you'll find an overview of the key files and how to use this configuration.
# Files

1. `main.tf`
    The main.tf file defines the AWS EC2 instance resource, specifying the AMI, subnet, and instance type.
    ```bash
    resource "aws_instance" "ec2-aws_instance" {
    ami           = var.aws_ami_id
    subnet_id     = var.aws_subnet_id
    instance_type = var.aws_instance_type
    }
    ```
2. `providers.tf`
The providers.tf file configures the AWS provider with the specified region.

    ```bash
    provider "aws" {
        region = "us-west-2"
    }
    ```
3. `terraform.tfvars`
   The terraform.tfvars file contains variable values such as AMI ID, instance type, and subnet ID. Customize these variables to match your requirements.
    ```bash
    aws_ami_id        = "ami-008fe2fc65df48dac"
    aws_instance_type = "t2.micro"
    aws_subnet_id     = "subnet-05affe733ffa5343b"
    ```
4. `variable.tf`
   The variable.tf file defines input variables with descriptions.
   ```bash
    variable "aws_ami_id" {
    description = "Value of the aws_ami_id"
    }

    variable "aws_instance_type" {
    description = "Value of the aws_instance_type"
    }

    variable "aws_subnet_id" {
    description = "Value of the aws_subnet_id"
    }
   ```
5. `output.tf`
   The output.tf file specifies the output, which is the public IP address of the created EC2 instance.
   ```bash
    output "public-ip" {
    value = aws_instance.ec2-aws_instance.public_ip
    }
   ```
# Usage
1. Set your **AWS credentials** using **environment variables** or **AWS CLI**.
2. Customize the values in **terraform.tfvars** to match your requirements.
3. Run the following commands in the terminal:
    ```bash
    terraform init
    terraform apply
    ```

4. This will initialize the Terraform configuration and apply the changes to create the AWS EC2 instance.

5. After completion, the public IP address of the created EC2 instance will be displayed as an output.

# Cleanup
To destroy the resources created by Terraform and avoid incurring charges, run:

```bash
terraform destroy
```

# Note
Make sure to review and adjust the configuration files according to your specific needs before applying the changes. For more detailed information on each file and its purpose, refer to the respective sections above.

<p style= text-align:center;><i>Readme By</i> <strong>@Shiva</strong></p>
