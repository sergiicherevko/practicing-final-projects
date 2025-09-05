variable "cluster_name" {
  type = string
}

variable "k8s_version" {
  type = string
}

variable "subnets_list" {
  type = list(string)
}

variable "role_name" {
  type = string
}
