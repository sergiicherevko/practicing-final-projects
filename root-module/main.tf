module "kubernetes_cluster" {
  source       = "../eks-module"
  cluster_name = var.root_cluster_name
  role_name    = "adapt-ex-cluster-role-dev"
  k8s_version  = "1.31"
  subnets_list = [
    "subnet-0e51b86773f6f6aa4",
    "subnet-062246915bde0ac12",
    "subnet-071c8c8c1dd4c5732"
  ]
}
