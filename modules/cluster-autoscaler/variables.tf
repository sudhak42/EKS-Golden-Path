variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "cluster_autoscaler_version" {
  description = "Cluster Autoscaler image tag"
  type        = string
  default     = "v1.29.0"
}

variable "hpa_namespace" {
  description = "Namespace for HPA"
  type        = string
  default     = "default"
}

variable "hpa_target_deployment" {
  description = "Target deployment name for HPA"
  type        = string
}

variable "hpa_min_replicas" {
  description = "Minimum replicas for HPA"
  type        = number
  default     = 2
}

variable "hpa_max_replicas" {
  description = "Maximum replicas for HPA"
  type        = number
  default     = 10
}

variable "hpa_cpu_utilization" {
  description = "Target CPU utilization for HPA"
  type        = number
  default     = 70
}
