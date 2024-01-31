# Configure the AWS provider with the desired region for resource deployment.
provider "aws" {
  region = "us-east-1"
}

# Define an AWS EC2 instance resource named "demo."
resource "aws_instance" "demo" {
  # Specify the Amazon Machine Image (AMI) for the EC2 instance.
  ami           = "ami-afaf254152"
  
  # Set the instance type for the EC2 instance (e.g., t2.micro).
  instance_type = "t2.micro"
  
  # Specify the ID of the subnet in which the EC2 instance will be launched.
  subnet_id     = "subnet-013516516"
}

# Define an AWS S3 bucket resource 
resource "aws_s3_bucket" "Unique_bucket_name" {
  # Specify the name for the S3 bucket.
  bucket = "Unique_bucket_name"
}
resource "aws_dynamodb_table" "lock_table" {
  name           = "your-dynamodb-table-name"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
