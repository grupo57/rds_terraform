# Configura o provedor da AWS e a regi�o onde os recursos ser�o criados
provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "grupo57_dev" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.dev_db_username
  password             = var.dev_db_password
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
  username             = var.prod_db_username
  password             = var.prod_db_password
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
  type = string
}

variable "dev_db_username" {
  type      = string
  sensitive = true
}

variable "dev_db_password" {
  type      = string
  sensitive = true
}

variable "prod_db_username" {
  type      = string
  sensitive = true
}

variable "prod_db_password" {
  type      = string
  sensitive = true
}