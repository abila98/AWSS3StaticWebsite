resource "aws_s3_bucket" "static_website" {
  bucket = var.bucket_name

  website {
    index_document = var.index_document
    error_document = var.error_document
  }

  tags = {
    Name        = var.bucket_name
    Environment = "dev"
  }
}


resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.static_website.id

  block_public_acls       = false #if true, any attempt to grant public access using ACLs will be denied
  block_public_policy     = false #if true, it prevents bucket policies from granting public access
  ignore_public_acls      = false #if true, this setting indicates that Amazon S3 should ignore any public ACLs
  restrict_public_buckets = false #if true , this setting prevents the creation of new S3 buckets that allow public access
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.static_website.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          "${aws_s3_bucket.static_website.arn}/*",
          "${aws_s3_bucket.static_website.arn}"
        ]
      }
    ]
  })
}

