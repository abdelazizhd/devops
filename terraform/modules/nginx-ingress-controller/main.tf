resource "helm_release" "nginx-ingress-controller" {
  name       = var.name
  repository = "https://charts.bitnami.com/nginx-ingress-controller"
  chart      = "nginx-ingress-controller"
  namespace  = var.namespace
}