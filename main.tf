provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA3J7BNPLRYS7KJLWY"
  secret_key = "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"
}

#1 -this will create a S3 bucket in AWS
resource "aws_s3_bucket" "terraform_state_s3" {
  #make sure you give unique bucket name
  bucket = "terraform-teknobucket1-state" 
  force_destroy = true
# Enable versioning to see full revision history of our state files
  versioning {
         enabled = true
        }


