variable "sns_topic_arn" {
  type = string
  description = "SNS Topic ARN"
}

variable "increase_ec2_arn" {
  type = string
  description = "Application Load Balancer Policy"
}

variable "decrease_ec2_arn" {
  type = string
  description = "Application Load Balancer Policy"
}


variable "instance_id" {
  type = string
  description = "Instance ID"
}
