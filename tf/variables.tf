variable "stack_name_prefix" {
}

variable "environment" {
}

variable "region" {
}

variable "vpc_id" {
}

variable "vpc_cidr" {
}

variable "private_subnet_ids" {
  description = "Comma separated list of subnet ids"
}

variable "allowed_security_groups" {
  description = "Comma-Separated List of security groups to whitelist"
  default = ""
}

variable "database_name" {
}

variable "database_username" {
}

variable "database_password" {
}

variable "skip_final_snapshot" {
  default = true
}

variable "role_arn" {

}