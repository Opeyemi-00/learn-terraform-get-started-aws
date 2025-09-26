provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "bucketexample" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "bucketexample" {
  bucket = aws_s3_bucket.bucketexample.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_ownership_controls" "bucketexample" {
  bucket = aws_s3_bucket.bucketexample.id

    rule {
    object_ownership = "BucketOwnerPreferred"
  }

}

resource "aws_s3_bucket_public_access_block" "bucketexample" {
  bucket                  = aws_s3_bucket.bucketexample.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "bucketexample" {
  bucket = aws_s3_bucket.bucketexample.id
  depends_on = [
    aws_s3_bucket_ownership_controls.bucketexample,
    aws_s3_bucket_public_access_block.bucketexample,
  ]

  acl = "public-read"
}

resource "aws_s3_bucket_versioning" "bucketexample" {
  bucket = aws_s3_bucket.bucketexample.id

  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_s3_bucket_policy" "bucketexample" {
  depends_on = [
    aws_s3_bucket_acl.bucketexample
  ]

  bucket = aws_s3_bucket.bucketexample.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.bucketexample.arn,
          "${aws_s3_bucket.bucketexample.arn}/*",
        ]
      },
    ]
  })
}