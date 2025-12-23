# SNS topic for EC2 servers alerts
resource "aws_sns_topic" "servers_alerts" {
  name = "${local.name_prefix}-servers-alerts"
}

# SNS topic for EKS alerts
resource "aws_sns_topic" "eks_alerts" {
  name = "${local.name_prefix}-eks-alerts"
}
resource "aws_cloudwatch_metric_alarm" "jenkins_high_cpu" {
  alarm_name          = "${local.name_prefix}-jenkins-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80

  dimensions = {
    InstanceId = "jenkins-instance-id"
  }

  alarm_actions = [aws_sns_topic.servers_alerts.arn]
}
resource "aws_cloudwatch_metric_alarm" "eks_nodes_high_cpu" {
  alarm_name          = "${local.name_prefix}-eks-nodes-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "node_cpu_utilization"
  namespace           = "ContainerInsights"
  period              = 300
  statistic           = "Average"
  threshold           = 80

  alarm_actions = [aws_sns_topic.eks_alerts.arn]
}
resource "aws_cloudwatch_dashboard" "servers_dashboard" {
  dashboard_name = "${local.name_prefix}-servers-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric"
        properties = {
          region = var.aws_region
          metrics = [
            ["AWS/EC2", "CPUUtilization", "InstanceId", "jenkins-instance-id"]
          ]
          period = 300
          stat   = "Average"
          title  = "Jenkins CPU Utilization"
          annotations = {
            horizontal = []
          }
        }
      }
    ]
  })
}

