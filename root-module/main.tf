module "kubernetes_cluster" {
  source       = "../eks-module"
  project_name = var.root_project_name
  environment  = var.root_environment
  k8s_version  = var.root_k8s_version
  subnets_list = module.main_vpc.subnet_ids
}

module "main_vpc" {
  source            = "../vpc-module"
  cidr_block_prefix = "10.7"
  project_name      = var.root_project_name
  vpc_region        = var.root_vpc_region
}
