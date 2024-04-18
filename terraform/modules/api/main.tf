resource "helm_release" "api" {
  name       = var.name
  chart      = "../../../charts/api"
  namespace  = var.namespace

  set {
    name  = "namespace"
    value = var.namespace
  }

  set {
    name  = "domain"
    value = var.domain
  }

  set {
    name  = "image.repository"
    value = var.image_repository
  }

  set {
    name  = "env.DATABASE_HOST"
    value = var.database_host
  }

  set {
    name  = "env.DATABASE_NAME"
    value = var.database_name
  }

  set {
    name  = "env.DATABASE_USER"
    value = var.database_user
  }

  set {
    name  = "env.DATABASE_PASSWORD"
    value = var.database_password
  }
}