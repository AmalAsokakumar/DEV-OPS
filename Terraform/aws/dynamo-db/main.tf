resource "aws_dynamodb_table" "test-table" {
  name         = "cars"
  hash_key     = "VIN" # this will act as the primery key vehicle identification number
  billing_mode = "PAY_PER_REQUEST"
  attribute { # attibutes of the table 
    name = "VIN"
    type = "S"
  }
}
resource "aws_dynamodb_table_item" "car-item" {
  table_name = aws_dynamodb_table.test-table.name
  hash_key   = aws_dynamodb_table.test-table.hash_key
  item       = <<ITEM
{
  "Manufacturer": {"S": "Toyato"},
  "Make": {"S": "Corolla"},
  "Year": {"N": "2004"},
  "VIN": {"S": "4Y1SL689DC97765"}
}
ITEM
}