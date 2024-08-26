
variable "sns_name" {
  type = string
  description = "Name of SNS Topic"
}

variable "discord_webhook_url" {
  type = string
  description = "Discord Webhook URL"
}

variable "role_lambda_arn" {
  type = string
  description = "Lambda Role ARN"
}

variable "aws_lambda_function_arn" {
  type = string
  description = "Lambda Function ARN"
}
