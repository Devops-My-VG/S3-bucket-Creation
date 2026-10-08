# S3 Bucket - Shared Metadata Store

## Features
- Shared metadata bucket for infrastructure
- Used by EC2, ECS, Kubernetes, RDS, and other repos
- Fixed name for predictable pathing
- Versioning (90-day expiry for old versions, 30-day IA transition)
- AES256 encryption with bucket keys
- TLS-only access enforced via bucket policy
- Public access fully blocked
- Abort incomplete multipart uploads after 7 days
- Placeholder folders included

## Shared Folder Layout
- s3://<bucket>/ec2/<resource-id>.json
- s3://<bucket>/ecs/<cluster-name>/<service>.json
- s3://<bucket>/kubernetes/<cluster-name>/kubeconfig.yaml
- s3://<bucket>/kubernetes/<cluster-name>/details.json
- s3://<bucket>/rds/<db-id>.json
- s3://<bucket>/other/<name>.json

## Consuming Options
Option A — Read SSM parameter:
\`/infra/s3/terraform-infra/bucket_name\`

Option B — Reference via GitHub Actions variable or hardcode

## Prereqs
- GitHub secrets: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION
- AWS account ID (for bucket name)
- IAM permissions: s3:*, ssm:PutParameter, ssm:GetParameter

## Usage
- Apply: push to main OR Actions -> S3 Bucket - Apply -> Run workflow
- Destroy: Actions -> S3 Bucket - Destroy -> Run workflow -> type DESTROY

## Warnings
- force_destroy = true — ALL data including versions is permanently deleted. No recovery.
- Bucket name MUST include AWS account ID for uniqueness.
