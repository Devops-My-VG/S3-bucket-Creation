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
  description = "S3 bucket name (unique if empty)"
  default     = ""
}

variable "enable_versioning" {
  type        = bool
  description = "Enable S3 bucket versioning"
  default     = true
}

variable "force_destroy" {
  type        = bool
  description = "Force destroy the bucket (delete objects)"
  default     = false
}
