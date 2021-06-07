
data "aws_caller_identity" "current" {}

####################################
## Create SNS Topic 
####################################

resource "aws_sns_topic" "sns_topic" {
  name              = var.topic_name
  display_name      = var.display_name
  kms_master_key_id = var.kms_master_key_id
  tags              = var.tags
}

####################################
## Create SNS Policy 
####################################

resource "aws_sns_topic_policy" "sns_topic_policy" {
  arn = aws_sns_topic.sns_topic.arn
  policy = templatefile("${path.module}/templates/sns_${var.access_type}_policy.tpl",
    {
      topic_arn        = aws_sns_topic.sns_topic.arn,
      account_owner_id = data.aws_caller_identity.current.account_id
  })
}

# SNS - SQS Subscription example 
resource "aws_sns_topic_subscription" "sns_sqs_subscription" {
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = var.protocol
  endpoint  = var.endpoint
}