terraform {
  backend "s3" {
    encrypt = true
    dynamodb_table = "terraform-state-lock-dynamo"
    bucket = "wk7-project2-bucket"
    key    = "wk7-project/terraform.tfstate"
    region = "us-east-2"
  }
}

