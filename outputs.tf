output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_ca_certificate" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = module.eks.cluster_certificate_authority_data
}

output "eks_kubeconfig" {
  description = "Kubeconfig for the EKS cluster"
  value       = module.eks.kubeconfig
  sensitive   = true
}
