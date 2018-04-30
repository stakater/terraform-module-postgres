provider "aws" {
  region = "${var.region}"
}

data "aws_availability_zones" azs { }

terraform {
  backend "s3" {
  }
}

module "postgres" {
  source = "github.com/stakater/blueprint-storage-aws.git//modules/rds/postgres?ref=1.0.0"
  name = "${var.stack_name_prefix}-${var.environment}-${var.database_name}"
  vpc_id = "${var.vpc_id}"
  vpc_cidr = "${var.vpc_cidr}"

  allowed_security_groups = "${var.allowed_security_groups}"
  database_identifier = "${var.stack_name_prefix}-${var.environment}-${var.database_name}"
  subnet_ids = "${var.private_subnet_ids}"

  database_name = "${var.database_name}"
  database_username = "${var.database_username}"
  database_password = "${var.database_password}"
  skip_final_snapshot = "${var.skip_final_snapshot}"
}
