provider "aws" {
  region = var.region
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
}

data "aws_availability_zones" "available" {
}

locals {
  cluster_name = "devops-test-eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix = "worker_group_mgmt_one"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [var.vpc_cidr]
  }
}

module "eks" {
  source          = "./terraform-aws-eks"
  cluster_name    = var.cluster_name
  cluster_version = "1.20"
  subnets         = [var.subnet1, var.subnet2] 

  tags = {
    Environment = "dev"
    Task        = "devops-test"
    GithubRepo  = "terraform-aws-eks"
    GithubOrg   = "terraform-aws-modules"
  }

  vpc_id = var.vpc_id

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t2.micro"
      asg_min_size                  = 2
      asg_desired_capacity          = 2
      asg_max_size                  = 3
      root_volume_size              = 8
      additional_userdata           = "echo devops-test"
      key_name                      = var.key_name
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
      subnets                       = ["${var.subnet1}", "${var.subnet2}"]
    }
  ]
}
