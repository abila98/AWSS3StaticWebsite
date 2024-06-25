# Define the DynamoDB table
resource "aws_dynamodb_table" "counter_dynamodb" {
  name           = "hit_counter"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"  # 'S' denotes a string type
  }
}

resource "aws_dynamodb_table_item" "view_item" {
  table_name = aws_dynamodb_table.counter_dynamodb.name
  hash_key   = "id"

item = <<ITEM
{
  "id": {"S": "1"},
  "views": {"N": "1"}
}
ITEM
}


