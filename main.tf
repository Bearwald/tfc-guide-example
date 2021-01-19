provider "aws" {
  version = "2.33.0"
  access_key = "AKIAIHK5CBPXPAB5X5ZQ"
  secret_key = "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"
  region = var.aws_region
}

provider "random" {
  version = "2.2"
}

resource "random_pet" "table_name" {}

resource "aws_dynamodb_table" "tfc_example_table" {
  name = "${var.db_table_name}-${random_pet.table_name.id}"

  read_capacity  = var.db_read_capacity
  write_capacity = var.db_write_capacity
  hash_key       = "UUID"

  attribute {
    name = "UUID"
    type = "S"
  }
}
