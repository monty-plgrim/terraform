resource "aws_iam_user" "this" {
  name = var.name
  path = var.path
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

resource "aws_iam_user_login_profile" "this" {
  user                    = aws_iam_user.this.name
  password_reset_required = true
}

resource "aws_iam_user_group_membership" "this" {
  user   = aws_iam_user.this.name
  groups = var.groups
}

resource "aws_iam_user_policy_attachment" "user_policies" {
  count      = length(var.user_policies_inline)
  user       = aws_iam_user.this.name
  policy_arn = lookup(var.policies_inline, var.user_policies_inline[count.index]).arn
}

resource "aws_iam_user_policy_attachment" "user_policies_aws" {
  count      = length(var.user_policies_aws)
  user       = aws_iam_user.this.name
  policy_arn = lookup(var.policies_aws, var.user_policies_aws[count.index]).arn
}