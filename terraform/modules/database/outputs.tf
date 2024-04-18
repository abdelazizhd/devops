output "host" {
  value = "${var.name}-mysql-headless.${var.namespace}.svc.cluster.local"
}

output "root_password" {
  value = local.mysql_root_password
}

output "password" {
  value = local.mysql_password
}