provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "grupo57_dev" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_username_dev
  password             = var.db_password_dev
  db_subnet_group_name = "default"
  publicly_accessible  = false
  skip_final_snapshot  = true
  tags = {
    Name = "Dev MySQL Database"
  }
}

resource "aws_db_instance" "grupo57" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_username_prod
  password             = var.db_password_prod
  db_subnet_group_name = "default"
  publicly_accessible  = false
  skip_final_snapshot  = true
  tags = {
    Name = "Prod MySQL Database"
  }
}

output "dev_db_endpoint" {
  value = aws_db_instance.grupo57_dev.endpoint
}

output "prod_db_endpoint" {
  value = aws_db_instance.grupo57.endpoint
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "db_username_dev" {
  type = string
}

variable "db_password_dev" {
  type = string
}

variable "db_username_prod" {
  type = string
}

variable "db_password_prod" {
  type = string
}