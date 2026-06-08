resource "aws_dynamodb_table" "counter_dynamodb" {
  name         = "counter_dynamodb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = "counter-dynamodb"
  }
}