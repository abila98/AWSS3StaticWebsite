variable "region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "us-west-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
  default     = "abila-static-website-bucket-v2"
}

variable "index_document" {
  description = "The index document for the website."
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "The error document for the website."
  type        = string
  default     = "error.html"
}

