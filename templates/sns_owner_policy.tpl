{
  "Version": "2008-10-17",
  "Id": "DefaultPolicy",
  "Statement": [
    {
      "Sid": "DefaultOwnerAllow",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "SNS:GetTopicAttributes",
        "SNS:SetTopicAttributes",
        "SNS:AddPermission",
        "SNS:RemovePermission",
        "SNS:DeleteTopic",
        "SNS:Subscribe",
        "SNS:ListSubscriptionsByTopic",
        "SNS:Publish",
        "SNS:Receive"
      ],
      "Resource": "${topic_arn}",
      "Condition": {
        "StringEquals": {
          "AWS:SourceOwner": "${account_owner_id}"
        }
      }
    }
  ]
}