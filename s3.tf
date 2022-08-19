#provider "aws" {

#region ="us-east-2"

}

resource "aws_s3_bucket" "examples" {
  bucket = "my-exampel-bucket"
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.examples.id
  acl    = "private"
}
