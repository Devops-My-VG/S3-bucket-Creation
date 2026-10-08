# S3 Bucket

Standalone Terraform repository to manage a single AWS S3 bucket with best practices.

## Features
- Versioning enabled
- AES256 server-side encryption
- Public access blocked
- Bucket owner enforced
- Lifecycle rule to abort incomplete multi-part uploads
- SSM Parameter Store parameter for bucket discovery

## Architecture
This repository is INDEPENDENT. It does not depend on any other infrastructure project and utilizes its own Terraform state.

## Setup
Ensure AWS credentials are configured in GitHub secrets:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_DEFAULT_REGION`

## Usage

### Create
Push changes to the `main` branch or trigger manually via Actions.

### Destroy
1. Navigate to Actions → S3 Bucket - Destroy
2. Click Run workflow
3. Set input `confirm` to `DESTROY`
4. Set input `force` to `true` if you need to delete a non-empty bucket

## Terraform Commands

### Init
```bash
terraform init
```

### Plan
```bash
terraform plan
```

### Apply
```bash
terraform apply -auto-approve
```

### Destroy
```bash
terraform destroy -auto-approve
```

## Variables

| Name | Description | Default |
| :--- | :--- | :--- |
| `aws_region` | AWS region | `"us-east-1"` |
| `project_name` | Project name | `"terraform-infra"` |
| `environment` | Environment name | `"dev"` |
| `bucket_name` | S3 bucket name | `""` |
| `enable_versioning`| Enable versioning | `true` |
| `force_destroy` | Force destroy | `false` |

## Outputs

| Name | Description |
| :--- | :--- |
| `bucket_name` | The name of the S3 bucket |
| `bucket_arn` | The ARN of the S3 bucket |
| `bucket_region` | The region of the S3 bucket |
| `bucket_domain_name` | The domain name of the S3 bucket |
| `ssm_parameter_name` | The SSM path to the bucket name |
