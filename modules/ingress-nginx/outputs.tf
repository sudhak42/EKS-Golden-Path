output "nginx_ingress_status" {
  description = "Helm release status"
  value       = helm_release.nginx_ingress.status
}

output "nginx_ingress_namespace" {
  description = "Namespace where ingress controller is deployed"
  value       = var.namespace
}
