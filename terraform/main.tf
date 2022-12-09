resource "aws_s3_bucket" "example" {
  bucket = "my-new-bucket"

  tags = {
    Name        = "my-new-bucket"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  source = "www/index.html"
  content_type = "text/html"
  etag = filemd5("www/index.html")
  acl = "public-read"
  bucket = aws_s3_bucket.example.bucket
  key    = "index.html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.example.bucket
  key    = "error.html"
  source = "www/error.html"
  content_type = "text/html"
  etag = filemd5("www/error.html")
  acl = "public-read"
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.example.bucket
  index_document {
    suffix = aws_s3_object.index.key
 }

  error_document {
    key = aws_s3_object.error.key
}
  routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": ""
    }
}]
EOF

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



