#---------------------------------------------------------#
#Following variables used for setting up SNS resources
#---------------------------------------------------------#
display_name      = "my-sns-topic"
kms_master_key_id = "aws/sns"
access_type       = "subscribe"
protocol          = "sqs"
endpoint          = "arn:aws:sqs:us-west-2:123456789012:MySqs"