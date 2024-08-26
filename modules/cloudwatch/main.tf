resource "aws_cloudwatch_metric_alarm" "increase_ec2_alarm" {
  alarm_name                = "increase-ec2-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 70
  alarm_description         = "This metric monitors ec2 cpu utilization, if it goes above 70% for 2 periods it will trigger an alarm."
  insufficient_data_actions = []
  alarm_actions = [
      "${var.sns_topic_arn}",
      "${var.increase_ec2_arn}"
  ]
  dimensions = {
    InstanceId = "${var.instance_id}"
  }
}

resource "aws_cloudwatch_metric_alarm" "decrease_ec2_alarm" {
  alarm_name                = "decrease-ec2-alarm"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 40
  alarm_description         = "This metric monitors ec2 cpu utilization, if it goes below 40% for 2 periods it will trigger an alarm."
  insufficient_data_actions = []
  alarm_actions = [
      "${var.sns_topic_arn}",
      "${var.decrease_ec2_arn}"
  ]
  dimensions = {
    InstanceId = "${var.instance_id}"
  }
}
