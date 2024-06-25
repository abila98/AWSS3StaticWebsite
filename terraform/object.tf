resource "aws_s3_bucket_object" "index_html" {
  bucket       = aws_s3_bucket.static_website.bucket
  key          = "index.html"
  source       = "../website/index.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "error_html" {
  bucket       = aws_s3_bucket.static_website.bucket
  key          = "error.html"
  source       = "../website/error.html"
  content_type = "text/html"
}


resource "aws_s3_bucket_object" "index_js" {
  bucket = aws_s3_bucket.static_website.bucket
  key    = "index.js"
  source = "../website/index.js"
  content_type = "application/javascript"
}

