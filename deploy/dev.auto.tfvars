#---------------------------------------------------------#
#Following variables used for setting up SNS resources
#---------------------------------------------------------#
# 
#❯ aws sts get-caller-identity
#{
#    "UserId": "AROATMFZELFLJIO5DC4CU:tonynv-Isengard",
#    "Account": "YOUR-ACCOUNT-ID(012345678912)",
#    "Arn": "arn:aws:sts::YOUR-ACCOUNT-ID(012345678912):assumed-role/Admin/tonynv-Isengard"
#}
#
#
#

display_name      = "my-sns-topic"
kms_master_key_id = "aws/sns"
access_type       = "subscribe"
protocol          = "sqs"
endpoint          = "arn:aws:sqs:us-west-2:REPLACE-ME-WITH-ACCOUNT-ID:MySqs"