variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Project name"
  default     = "terraform-infra"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name (fixed, globally unique)"
}

variable "enable_versioning" {
  type        = bool
  description = "Enable S3 bucket versioning"
  default     = true
}

variable "force_destroy" {
  type        = bool
  description = "Force destroy the bucket (delete objects)"
  default     = true
}

variable "noncurrent_version_days" {
  type        = number
  description = "Lifecycle expiry for old versions"
  default     = 90
}

variable "log_retention_days" {
  type        = number
  description = "Access log retention in days"
  default     = 30
}
