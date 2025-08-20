output "coredns_addon_status" {
  description = "CoreDNS add-on status"
  value       = aws_eks_addon.coredns.status
}

output "kube_proxy_addon_status" {
  description = "kube-proxy add-on status"
  value       = aws_eks_addon.kube_proxy.status
}

output "vpc_cni_addon_status" {
  description = "VPC CNI add-on status"
  value       = aws_eks_addon.vpc_cni.status
}

output "ebs_csi_addon_status" {
  description = "EBS CSI add-on status"
  value       = aws_eks_addon.ebs_csi.status
}

output "efs_csi_addon_status" {
  description = "EFS CSI add-on status"
  value       = aws_eks_addon.efs_csi.status
}
