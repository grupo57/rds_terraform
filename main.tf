variable "environment" {
  description = "The environment to deploy (dev or main)"
  type        = string
}

variable "db_username" {
  description = "The database username"
  type        = string
}

variable "db_password" {
  description = "The database password"
  type        = string
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "grupo51_dev" {
  count                = var.environment == "dev" ? 1 : 0
  allocated_storage    = 10
  db_name              = "grupo51_dev"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}

resource "aws_db_instance" "grupo51_prod" {
  count                = var.environment == "prod" ? 1 : 0
  allocated_storage    = 20
  db_name              = "grupo51"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}