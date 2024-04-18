# Generate random value for the passwords
resource "random_password" "password" {
  length           = 8
  lower            = true
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
  min_upper        = 1
  numeric          = true
  override_special = "_"
  special          = true
  upper            = true
}

locals {
  mysql_root_password = var.root_password != null ? var.root_password : random_password.password.result
  mysql_password = var.password != null ? var.password : random_password.password.result
}

resource "helm_release" "mysql" {
  name       = var.name
  repository = "https://charts.bitnami.com/mysql"
  chart      = "mysql"
  namespace  = var.namespace

  set {
    name  = "persistence.enabled"
    value = "true"
  }

  set {
    name  = "auth.rootPassword"
    value = local.mysql_root_password
  }

  set {
    name  = "auth.database"
    value = var.database
  }

  set {
    name  = "auth.username"
    value = var.username
  }

  set {
    name  = "auth.password"
    value = local.mysql_password
  }
}