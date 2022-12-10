resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.env_type
  }
}


resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = var.acl_public
}

resource "aws_s3_object" "index" {
  source = var.index_source
  content_type = var.type_html
  etag = filemd5(var.index_source)
  acl = var.acl_public
  bucket = aws_s3_bucket.example.bucket
  key    = var.index_key
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.example.bucket
  key    = var.error_key
  source = var.error_source
  content_type = var.type_html
  etag = filemd5(var.error_source)
  acl = var.acl_public
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.example.bucket
  index_document {
    suffix = aws_s3_object.index.key
 }

  error_document {
    key = aws_s3_object.error.key
  }
}


resource "aws_s3_bucket_policy" "example" {
  bucket = aws_s3_bucket.example.id
  policy = <<POLICY
    {
      "Version": "2012-10-17",
      "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-new-bucket/"
    }
  ]
}
POLICY
  }



