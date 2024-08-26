resource "aws_sns_topic" "topic" {
  name = var.sns_name
}

resource "aws_sns_topic_subscription" "topic_lambda_subscription" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "lambda"
  endpoint = var.aws_lambda_function_arn
}

# resource "aws_lambda_function" "lambda" {
#   filename = "test.zip"
#   function_name    = "NotificationDiscord"
#   role             = "${var.role_lambda_arn}"
#   handler          = "test.handler"
#   runtime          = "python3.10"

#   environment {
#     variables = {
#       WEBHOOK_URL = "${var.discord_webhook_url}"
#     }
#   }
# }

# resource "aws_lambda_permission" "with_sns" {
#     statement_id = "AllowExecutionFromSNS"
#     action = "lambda:InvokeFunction"
#     function_name = "${aws_lambda_function.lambda.arn}"
#     principal = "sns.amazonaws.com"
#     source_arn = "${aws_sns_topic.topic.arn}"
# }
