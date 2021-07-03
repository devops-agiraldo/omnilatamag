resource "aws_s3_bucket_object" "kp1" {
  bucket = aws_s3_bucket.buck.bucket
  key    = aws_key_pair.generated_key1.key_name
  source = "./myKey1.pem"
}

resource "aws_s3_bucket_object" "kp2" {
  bucket = aws_s3_bucket.buck.bucket
  key    = aws_key_pair.generated_key2.key_name
  source = "./myKey2.pem"
}

resource "aws_s3_bucket_object" "kp3" {
  bucket = aws_s3_bucket.buck.bucket
  key    = aws_key_pair.generated_key3.key_name
  source = "./myKey3.pem"
}