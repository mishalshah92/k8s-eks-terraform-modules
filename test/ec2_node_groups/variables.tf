variable "aws_region" {
  default = "us-west-2"
}

variable "eks_cluster_name" {
  type = string
}

variable "eks_master_sg_id" {
  type = string
}

variable "eks_nodes_keypair" {
  type = string
}

variable "access_cidr_blocks" {
  type    = list(string)
  default = []
}

# Tags

variable "owner" {
  default = "mishah@groupon.com"
}

variable "stack" {
  default = "jenkins"
}

variable "env" {
  default = "learn"
}