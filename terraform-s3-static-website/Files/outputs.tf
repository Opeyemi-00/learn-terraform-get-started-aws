output "arn" {
	description = "Website arn"
	value = aws_s3_bucket.bucketexample.arn
}

output "name" {
	description = "bucketname"
	value = aws_s3_bucket.bucketexample.id
}

output "domain" {
  description = "Website domain"
  value = aws_s3_bucket_website_configuration.bucketexample.website_domain
}