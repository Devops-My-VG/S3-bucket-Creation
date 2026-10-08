output "bucket_name" {
  value       = aws_s3_bucket.this.id
  description = "The name of the S3 bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "The ARN of the S3 bucket"
}

output "bucket_region" {
  value       = aws_s3_bucket.this.region
  description = "The region of the S3 bucket"
}

output "bucket_domain_name" {
  value       = aws_s3_bucket.this.bucket_domain_name
  description = "The domain name of the S3 bucket"
}

output "ssm_parameter_name" {
  value       = aws_ssm_parameter.bucket_name.name
  description = "The SSM path to the bucket name"
}
