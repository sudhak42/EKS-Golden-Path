resource "helm_release" "cluster_autoscaler" {
  name       = "cluster-autoscaler"
  repository = "https://kubernetes.github.io/autoscaler"
  chart      = "cluster-autoscaler"
  version    = "9.29.0"

  namespace  = "kube-system"

  set {
    name  = "autoDiscovery.clusterName"
    value = var.cluster_name
  }

  set {
    name  = "awsRegion"
    value = var.aws_region
  }

  set {
    name  = "rbac.create"
    value = "true"
  }

  set {
    name  = "extraArgs.balance-similar-node-groups"
    value = "true"
  }

  set {
    name  = "extraArgs.expander"
    value = "least-waste"
  }

  set {
    name  = "image.tag"
    value = var.cluster_autoscaler_version
  }
}

resource "kubernetes_horizontal_pod_autoscaler_v2" "sample_hpa" {
  metadata {
    name      = "sample-app-hpa"
    namespace = var.hpa_namespace
  }

  spec {
    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = var.hpa_target_deployment
    }
    min_replicas = var.hpa_min_replicas
    max_replicas = var.hpa_max_replicas

    metric {
      type = "Resource"
      resource {
        name = "cpu"
        target {
          type                = "Utilization"
          average_utilization = var.hpa_cpu_utilization
        }
      }
    }
  }
}
