# Define an AWS S3 bucket resource with the specified bucket name.
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
}

# Configure ownership controls for the S3 bucket.
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.example.id

  # Set a rule to prefer bucket owner as the object owner.
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Configure public access settings for the S3 bucket.
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  # Disable blocking of public ACLs, public policies, and public access grants.
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Configure access control for the S3 bucket.
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id

  # Set the bucket ACL to "public-read" for broad public access.
  acl    = "public-read"
}

# Define an S3 object resource for the "index.html" file.
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.example.id
  key          = "index.html"
  source       = "./portfolio/index.html"
  acl          = "public-read"
  content_type = "text/html"
}

# Define an S3 object resource for the "error.html" file.
resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.example.id
  key          = "error.html"
  source       = "./portfolio/error.html"
  acl          = "public-read"
  content_type = "text/html"
}

# Configure the S3 bucket as a static website with specified index and error documents.
resource "aws_s3_bucket_website_configuration" "myconfig" {
  bucket = aws_s3_bucket.example.id

  # Specify the index document as "index.html".
  index_document {
    suffix = "index.html"
  }

  # Specify the error document as "error.html".
  error_document {
    key = "error.html"
  }

  # Make sure the S3 bucket ACL is applied before configuring website settings.
  depends_on = [aws_s3_bucket_acl.example]
}
