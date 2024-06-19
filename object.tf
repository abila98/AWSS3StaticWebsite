resource "aws_s3_bucket_object" "index_html" {
  bucket       = aws_s3_bucket.static_website.bucket
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "error_html" {
  bucket       = aws_s3_bucket.static_website.bucket
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
}

