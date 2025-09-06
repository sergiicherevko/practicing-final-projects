variable "root_cluster_name" {
  type = string
}

variable "root_role_name" {
  type = string
}

variable "root_k8s_version" {
  type = string
}

variable "root_subnets_list" {
  type = list(string)
}
