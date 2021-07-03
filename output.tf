output "az" {
	value = "${data.aws_availability_zones.az.names}"
}
output "bucket" {
	value = aws_s3_bucket.buck.bucket
}
