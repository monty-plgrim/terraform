resource "aws_iam_group_policy" "terraform_group_policy" {
  group = aws_iam_group.terraform_group.name
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : "*",
          "Resource" : "*"
        },
      ]
    }
  )
}