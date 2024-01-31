terraform {
  # Configure the backend for storing Terraform state remotely in an S3 bucket.
  backend "s3" {
    # Specify the name of the S3 bucket where the Terraform state will be stored.
    bucket = "Unique_bucket_name"

    # Define the key (path) within the S3 bucket where the Terraform state file will be stored.
    key = "example/terraform.tfstate"

    # Set the AWS region where the S3 bucket is located.
    region = "us-east-1"

    dynamodb_table = "your-dynamodb-table-name"
  }
}
