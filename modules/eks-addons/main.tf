resource "aws_eks_addon" "coredns" {
  cluster_name      = var.cluster_name
  addon_name        = "coredns"
  addon_version     = var.coredns_version
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name      = var.cluster_name
  addon_name        = "kube-proxy"
  addon_version     = var.kube_proxy_version
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name      = var.cluster_name
  addon_name        = "vpc-cni"
  addon_version     = var.vpc_cni_version
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "ebs_csi" {
  cluster_name      = var.cluster_name
  addon_name        = "aws-ebs-csi-driver"
  addon_version     = var.ebs_csi_version
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "efs_csi" {
  cluster_name      = var.cluster_name
  addon_name        = "aws-efs-csi-driver"
  addon_version     = var.efs_csi_version
  resolve_conflicts = "OVERWRITE"
}
