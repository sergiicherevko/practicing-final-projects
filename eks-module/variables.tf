variable "project_name" {
  type = string
}

variable "k8s_version" {
  type = string
}

variable "subnets_list" {
  type = list(string)
}

variable "environment" {
  type = string
}

variable "ec2_types" {
  type = list
}