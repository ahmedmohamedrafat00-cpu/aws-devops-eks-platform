resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.cluster_name}-nodes"
  node_role_arn  = aws_iam_role.eks_node_role.arn

  subnet_ids = var.private_subnet_ids

  instance_types = ["t3.medium"]

  ami_type = "AL2_x86_64"

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}

