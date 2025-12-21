# SNS topic for EC2 servers alerts
resource "aws_sns_topic" "servers_alerts" {
  name = "${local.name_prefix}-servers-alerts"
}

# SNS topic for EKS alerts
resource "aws_sns_topic" "eks_alerts" {
  name = "${local.name_prefix}-eks-alerts"
}
