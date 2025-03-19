# Create S3 Bucket for Terraform State
resource "aws_s3_bucket" "terraform_state" {
  bucket = "three-tier-architecture-buket" 
  acl    = "private"

  versioning {
    enabled = true # Enable versioning for state file recovery
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256" # Enable server-side encryption
      }
    }
  }

  tags = {
    Name = "Terraform State Bucket"
  }
}

# Create DynamoDB Table for State Locking
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "terraform-state-lock" 
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform State Lock Table"
  }
}
