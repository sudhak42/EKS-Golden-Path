terraform {
  required_version = ">= 1.5.0"
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "eks/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  region = var.aws_region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = var.subnet_ids
  vpc_id          = var.vpc_id

  enable_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  node_groups = {
    default = {
      desired_capacity = 3
      max_capacity     = 6
      min_capacity     = 1

      instance_types   = ["t3.medium"]
      ami_type         = "AL2_x86_64"
      k8s_labels = {
        "Environment" = var.environment
      }
      tags = {
        "k8s.io/cluster-autoscaler/enabled" = "true"
        "k8s.io/cluster-autoscaler/${var.cluster_name}" = "true"
        "Environment" = var.environment
        "CostCenter"  = var.cost_center
      }
    }
  }

  tags = {
    "Name"        = var.cluster_name
    "Environment" = var.environment
    "CostCenter"  = var.cost_center
  }

  # Optionally enable additional features
  enable_irsa = true
}

# Optional output for kubeconfig
output "kubeconfig" {
  value = module.eks.kubeconfig
  sensitive = true
}

output "cluster_name" {
  value = module.eks.cluster_name
}
