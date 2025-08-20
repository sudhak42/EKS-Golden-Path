variable "namespace" {
  description = "Namespace for the ingress controller"
  type        = string
  default     = "ingress-nginx"
}

variable "replica_count" {
  description = "Number of nginx controller replicas"
  type        = number
  default     = 2
}

variable "service_type" {
  description = "Service type for ingress controller (LoadBalancer/NodePort/ClusterIP)"
  type        = string
  default     = "LoadBalancer"
}

variable "metrics_enabled" {
  description = "Enable metrics endpoint"
  type        = bool
  default     = true
}
