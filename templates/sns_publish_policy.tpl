{
    "Version": "2008-10-17",
    "Id" : "SnsPublishPolicy",
    "Statement": [
        {
        "Sid" : "DefaultOwnerAllow",
        "Effect" : "Allow",
        "Principal" : {
            "AWS" : "*"
        },
        "Action" : [
                    "SNS:Publish"
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