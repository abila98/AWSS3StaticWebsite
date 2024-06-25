resource "null_resource" "wait_for_bucket_creation" {
  provisioner "local-exec" {
    command = <<EOT
      until aws s3 ls s3://${aws_s3_bucket.static_website.bucket} >/dev/null 2>&1; do
        echo "Waiting for S3 bucket creation..."
        sleep 5
      done
    EOT
  }
}
