output "website_url" {
  value = aws_s3_bucket.static_website.website_endpoint
}

output "function_url" {
  value = aws_lambda_function_url.counter_url.function_url
}

