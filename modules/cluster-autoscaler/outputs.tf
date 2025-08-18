output "cluster_autoscaler_status" {
  description = "Cluster Autoscaler Helm release status"
  value       = helm_release.cluster_autoscaler.status
}

output "sample_hpa_name" {
  description = "Name of the sample HPA created"
  value       = kubernetes_horizontal_pod_autoscaler_v2.sample_hpa.metadata[0].name
}
