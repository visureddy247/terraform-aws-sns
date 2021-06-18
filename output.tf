output "sns_topic_arn" {
  description = "SNS-topic arn"
  value       = aws_sns_topic.sns_topic.arn
}