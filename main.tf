variable "db_name" {
  description = "The database name"
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

variable "allocated_storage" {
  description = "The allocated storage for the database"
  type        = number
}

variable "engine_version" {
  default     = "8.0"
  description = "The workspace to deploy (dev or prod)"
  type        = string
}

variable "engine" {
  default     = "mysql"
  description = "The database engine"
  type        = string
}

variable "instance_class" {
  default     = "db.t3.micro"
  description = "The instance class"
  type        = string
}

variable "parameter_group_name" {
  default     = "default.mysql8.0"
  description = "The parameter group name"
  type        = string
}

variable "skip_final_snapshot" {
  default     = true
  description = "Skip final snapshot"
  type        = bool
}

variable "apply_immediately" {
  default     = true
  description = "Apply immediately"
  type        = bool
}

resource "aws_db_instance" "grupo57_db" {
  allocated_storage    = var.allocated_storage
  db_name              = "${var.db_name}_${terraform.workspace}"
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot
  identifier           = "${var.db_name}-${terraform.workspace}"

  tags = {
    Name = "${var.db_name}_${terraform.workspace}"
  }
}