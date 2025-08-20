variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "coredns_version" {
  description = "CoreDNS add-on version"
  type        = string
  default     = "v1.10.1-eksbuild.6"
}

variable "kube_proxy_version" {
  description = "kube-proxy add-on version"
  type        = string
  default     = "v1.29.1-eksbuild.1"
}

variable "vpc_cni_version" {
  description = "VPC CNI add-on version"
  type        = string
  default     = "v1.18.1-eksbuild.1"
}

variable "ebs_csi_version" {
  description = "EBS CSI add-on version"
  type        = string
  default     = "v1.29.1-eksbuild.1"
}

variable "efs_csi_version" {
  description = "EFS CSI add-on version"
  type        = string
  default     = "v1.7.4-eksbuild.1"
}
