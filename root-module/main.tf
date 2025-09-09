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
}

# output "root_subnet_ids" {
#   value = module.main_vpc.subnet_ids
# }


# resource "aws_instance" "demo_ec2" {
#   ami           = "ami-00ca32bbc84273381"
#   instance_type = "t3.micro"
#   subnet_id = data.aws_subnet.my_test_subnet.id

#   tags = {
#     Name = "HelloWorld"
#   }
# }

# data "aws_subnet" "my_test_subnet" {
#   filter {
#     name   = "tag:Name"
#     values = ["test-subnet-1"]
#   }
# }

resource "aws_db_instance" "imported_db" {
  allocated_storage     = 20
  engine                = "mysql"
  engine_version        = "8.0.42"
  instance_class        = "db.t4g.micro"
  username              = "admin"
  parameter_group_name  = "default.mysql8.0"
  skip_final_snapshot   = true
  storage_encrypted     = true
  max_allocated_storage = 1000
  copy_tags_to_snapshot = true
  monitoring_interval   = 60
  apply_immediately     = false
}
