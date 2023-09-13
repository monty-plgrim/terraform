terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">=1.2.0"
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_iam_user" "monty3" {
  name = "monty3"
}

resource "aws_iam_group" "terraform_group" {
  name = "terraform"
}

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
resource "aws_iam_group_membership" "terraform" {
  group = aws_iam_group.terraform_group.name
  name  = "terraform_membership"
  users = [
    aws_iam_user.monty3.name
  ]
}


#aws_iam_user_group_membership