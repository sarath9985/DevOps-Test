terraform {
  backend "s3" {
    bucket = var.bucket
    key = "eks-cicd/terraform.tfstate"
    region = var.region
    dynamodb_table = var.tablename
    encrypt        = true    
  }
}