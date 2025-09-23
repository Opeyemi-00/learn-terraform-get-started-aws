provider "aws" {
  region = "eu-west-2"
}
resource "aws_s3_bucket" "bucketexample" {
  bucket = "my-unique-bucket-name-opeyem00"
}

resource "aws_s3_bucket_acl" "aclexample" {
  bucket = aws_s3_bucket.bucketexample.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioningexample" {
  bucket = aws_s3_bucket.bucketexample.id

  versioning_configuration {
    status = "Enabled"
  }
}