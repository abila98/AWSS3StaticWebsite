data "aws_dynamodb_table" "counter_dynamodb" {
  name = "hit_counter"
}

# Lambda Function Configuration
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "lambda-script/counter.py"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "counter_lambda" {
  filename         = data.archive_file.lambda_zip.output_path
  function_name    = "counter_lambda"
  role             = aws_iam_role.lambda_role.arn
  handler          = "counter.lambda_handler"
  runtime          = "python3.12"
  source_code_hash = filebase64sha256(data.archive_file.lambda_zip.output_path)

  environment {
    variables = {
      TABLE_NAME = data.aws_dynamodb_table.counter_dynamodb.name
    }
  }
}

resource "aws_lambda_function_url" "counter_url" {
  function_name = aws_lambda_function.counter_lambda.arn
  authorization_type = "NONE" # Adjust if needed (e.g., AWS_IAM)

  cors {
    allow_credentials = false
    allow_origins     = ["*"]
    allow_methods     = ["GET","POST"]
    allow_headers     = ["content-type"]
    max_age           = 0
  }

}

