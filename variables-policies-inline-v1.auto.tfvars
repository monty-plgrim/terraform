policies_inline = {
  "s3-get-and-put-all-buckets" = {
    name        = "s3-get-and-put-all-buckets"
    description = "s3-get-and-put-all-buckets"
    policy      = {
      Version   = "2012-10-17"
      Statement = [
        {
          Action = [
            "s3:putObject",
            "s3:getObject"
          ]
          Effect   = "Allow"
          Resource = "*"
        }
      ]
    }
  },
  "cloudwatch-logs-readonly" = {
    name        = "cloudwatch-logs-readonly"
    description = "cloudwatch-logs-readonly"
    policy      = {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "VisualEditor0",
          "Effect" : "Allow",
          "Action" : [
            "logs:StartQuery",
            "logs:FilterLogEvents"
          ],
          "Resource" : "arn:aws:logs:*:430954932827:log-group:stg-plgrim"
        },
        {
          "Sid" : "VisualEditor1",
          "Effect" : "Allow",
          "Action" : [
            "logs:ListTagsLogGroup",
            "logs:TagLogGroup",
            "logs:DescribeLogGroups",
            "logs:UntagLogGroup",
            "logs:DescribeLogStreams",
            "logs:DescribeSubscriptionFilters",
            "logs:StartQuery",
            "logs:DescribeMetricFilters",
            "logs:FilterLogEvents",
            "logs:GetLogGroupFields"
          ],
          "Resource" : "arn:aws:logs:*:430954932827:log-group:stg-plgrim"
        },
        {
          "Sid" : "VisualEditor2",
          "Effect" : "Allow",
          "Action" : [
            "logs:GetLogEvents",
            "logs:FilterLogEvents"
          ],
          "Resource" : "arn:aws:logs:*:430954932827:log-group:stg-plgrim:log-stream:*"
        },
        {
          "Sid" : "VisualEditor3",
          "Effect" : "Allow",
          "Action" : [
            "logs:DescribeQueries",
            "logs:DescribeExportTasks",
            "logs:GetLogRecord",
            "logs:GetQueryResults",
            "logs:StopQuery",
            "logs:TestMetricFilter",
            "logs:DescribeQueryDefinitions",
            "logs:DescribeResourcePolicies",
            "logs:GetLogDelivery",
            "logs:DescribeDestinations",
            "logs:ListLogDeliveries"
          ],
          "Resource" : "*"
        },
        {
          "Sid" : "VisualEditor4",
          "Effect" : "Allow",
          "Action" : [
            "sns:Get*",
            "sns:List*"
          ],
          "Resource" : "arn:aws:sns:*:430954932827:*"
        },
        {
          "Sid" : "VisualEditor5",
          "Effect" : "Allow",
          "Action" : "autoscaling:Describe*",
          "Resource" : "*"
        },
        {
          "Sid" : "VisualEditor6",
          "Effect" : "Allow",
          "Action" : [
            "logs:Describe*",
            "logs:List*",
            "logs:StopQuery",
            "logs:TestMetricFilter",
            "logs:Get*"
          ],
          "Resource" : [
            "arn:aws:logs:*:430954932827:log-group:stg-plgrim:log-stream:*",
            "arn:aws:logs:*:430954932827:log-group:stg-plgrim"
          ]
        }
      ]
    }
  },
}
