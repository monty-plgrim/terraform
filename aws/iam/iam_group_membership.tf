resource "aws_iam_group_membership" "terraform" {
  group = aws_iam_group.terraform_group.name
  name  = "terraform_membership"
  users = [
    aws_iam_user.monty-terraform-3.name
  ]
}
