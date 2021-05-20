variable "region" {
  default = "us-east-1"
  type = string
}

variable "cluster_name" {
  default = "devops-test"
  type = string
}

variable "vpc_id" {
  default = "vpc-xxxxx"
  type = string
}

variable "vpc_cidr" {
  default = "172.31.x.x/16"
  type = string
}

variable "key_name" {
  default = "keyname"
  type = string
}

variable "subnet1" {
  default = "subnet-999999"
  type = string
}

variable "subnet2" {
  default = "subnet-99999"
  type = string
}

variable "bucket" {
  default = "bucket-name"
  type = string
}

variable "tablename" {
  default = "dynamo-db-tablename"
  type = string
}
