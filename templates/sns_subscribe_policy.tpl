{
    "Version": "2008-10-17",
    "Id" : "SnsSubscribePolicy",
    "Statement": [
        {
        "Sid" : "DefaultOwnerAllow",
        "Effect" : "Allow",
        "Principal" : {
            "AWS" : "*"
        },
        "Action" : [
                    "SNS:Subscribe"
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