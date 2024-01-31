# Terraform S3 Backend Example

## Overview

This example demonstrates how to use an S3 bucket as a backend for storing Terraform state files and a DynamoDB table for locking. This setup ensures that only one person can apply changes at a time to prevent conflicts when multiple engineers are working on the same project.

## Prerequisites

1. **Terraform Installed:** Ensure that you have Terraform installed on your local machine. You can download it [here](https://www.terraform.io/downloads.html).

2. **AWS Account:** You'll need an AWS account with appropriate credentials configured on your local machine.

## Usage

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/gadagojushiva/terraform_examples.git
    cd example-3
    ```

2. **Initialize Terraform:**

    ```bash
    terraform init
    ```

3. **Configure AWS Credentials:**

    ```bash
    aws configure
    ```

4. **Apply Terraform Configuration:**

    ```bash
    terraform apply
    ```

    When prompted, confirm the action to apply changes.

## Configuration Details
### Terraform Resources Configuration
You can find the configuration in main.tf
### Terraform Backend Configuration

The `backend.tf` file contains the configuration for using S3 as the backend and DynamoDB for locking:


```bash
terraform {
  backend "s3" {
    bucket = "your-s3-bucket-name"
    key    = "path/to/terraform.tfstate"
    region = "your-aws-region"
    dynamodb_table = "your-dynamodb-table-name"
  }
}
```

1. `bucket`: Specifies the name of the S3 bucket where the Terraform state will be stored.
2. `key`: Defines the path within the bucket for storing the terraform.tfstate file.
3. `region`: Sets the AWS region where the specified S3 bucket is located.
4. `dynamodb_table`: Specifies the name of the DynamoDB table for locking.

### AWS Provider Configuration
The main.tf file includes the AWS provider configuration:
```bash
provider "aws" {
region = "your-aws-region"
}
```
1. `region`: Specifies the AWS region where resources will be deployed.
## Locking Mechanism

The DynamoDB table specified in backend.tf is used as a locking mechanism. When an engineer runs terraform apply, Terraform checks and acquires a lock on the DynamoDB table. If the lock is already held by another user, Terraform will wait until the lock is released before proceeding.
### Security Considerations
Storing the Terraform state remotely in an S3 bucket enhances security by centralizing state management. Ensure that AWS credentials with the necessary permissions are configured securely.

### Cleanup
To destroy the created resources and remove the state from the S3 bucket, run:
```bash
terraform destroy
```
When prompted, confirm to proceed.