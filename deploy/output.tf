output "sns_topic_arn" {
  description = "SNS Topic ARN"
  value       = module.qs_sns.sns_topic_arn
}