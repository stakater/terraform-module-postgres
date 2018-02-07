output "postgres-endpoint" {
  value = "${module.postgres.endpoint}"
}

output "security-group-id" {
  value = "${module.postgres.security-group-id}"
}