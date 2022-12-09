output "s3_bucket_domain_name" {
    value = aws_s3_bucket.example.bucket_domain_name
}


output "s3_bucket_arn" {
    value = aws_s3_bucket.example.arn
}

output "s3_bucket_id" {
    value = aws_s3_bucket.example.id
}

output "s3_website_endpoint" {
    value = aws_s3_bucket.example.website_endpoint

}