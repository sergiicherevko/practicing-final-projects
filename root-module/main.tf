module "kubernetes_cluster" {
  source       = "../eks-module"
  cluster_name = var.root_cluster_name
  role_name    = var.root_role_name
  k8s_version  = var.root_k8s_version
  subnets_list = var.root_subnets_list
}

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
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0.42"
  instance_class       = "db.t4g.micro"
  username             = "admin"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  storage_encrypted = true
  max_allocated_storage = 1000
  copy_tags_to_snapshot = true
  monitoring_interval = 60
  apply_immediately = false
}
