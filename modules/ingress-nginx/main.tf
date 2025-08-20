resource "helm_release" "nginx_ingress" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.10.0"

  namespace  = var.namespace

  create_namespace = true

  set {
    name  = "controller.replicaCount"
    value = var.replica_count
  }

  set {
    name  = "controller.service.type"
    value = var.service_type
  }

  set {
    name  = "controller.metrics.enabled"
    value = var.metrics_enabled
  }
}
