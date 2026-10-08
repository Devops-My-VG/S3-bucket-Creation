# S3 Bucket

Standalone Terraform repository to manage a single AWS S3 bucket.

## Features
- Fixed bucket name (for stable identification)
- Versioning enabled
- AES256 server-side encryption
- Public access blocked
- Bucket owner enforced
- Lifecycle rule to abort incomplete multi-part uploads
- Public parameter in SSM Parameter Store for discovery

## Architecture
This repository uses a **Fixed Bucket Name** to ensure reproducibility and stability. It maintains its own Terraform state.

**WARNING:** Changing the `bucket_name` in `terraform.tfvars` after apply will force the deletion of the existing bucket and creation of a new one, resulting in data loss as S3 bucket names are immutable.

## Prerequisites
1. **State:** An existing S3 bucket (`terraform-state-414100287492-us-east-1`) and DynamoDB table (`terraform-locks`) to store state and manage locks.
2. **GitHub Secrets:** 
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_DEFAULT_REGION`
3. **GitHub Variables:**
   - Create a repository **Variable** (not Secret): `BUCKET_NAME` = `<your-fixed-bucket-name>` (must include AWS Account ID for global uniqueness).

## Usage

### Create/Apply
Push changes to the `main` branch. The CI/CD workflow will plan and apply automatically.

### Destroy
1. Navigate to Actions -> S3 Bucket - Destroy
2. Click Run workflow
3. Input `confirm`: `DESTROY`
4. Input `force`: `true`

---
*Note on force_destroy = true: All objects and versioned content will be permanently deleted upon destruction.*
