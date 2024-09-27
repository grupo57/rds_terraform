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

resource "aws_db_instance" "grupo51" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7 "
  instance_class       = "db.t3.micro"
  identifier           = "grupo51-${var.environment}"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}