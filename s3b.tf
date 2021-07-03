resource "aws_s3_bucket" "buck" {
  bucket = "bucketomniag"
  acl    = "private"

  tags = {
   Name        = "My bucket omniag"
   Environment = "Dev"
  }
}
