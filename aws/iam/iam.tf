module "user" {
  source               = "./user"
  for_each             = var.users
  name                 = each.value.name
  path                 = each.value.path
  email                = each.value.email
  groups               = each.value.groups
  user_policies_inline = each.value.policies_inline
  user_policies_aws    = each.value.policies_aws
  policies_inline      = data.aws_iam_policy.policies_inline_with_arn
  policies_aws         = var.policies_aws
}

module "policy" {
  source      = "./policy"
  for_each    = var.policies_inline
  name        = each.value.name
  description = each.value.description
  policy      = each.value.policy
}

data "aws_iam_policy" "policies_inline_with_arn" {
  for_each   = var.policies_inline
  name       = each.key
  depends_on = [module.policy]
}

module "group" {
  source                = "./group"
  for_each              = var.groups
  name                  = each.value.name
  group_policies_inline = each.value.policies_inline
  group_policies_aws    = each.value.policies_aws
  policies_inline       = data.aws_iam_policy.policies_inline_with_arn
  policies_aws          = var.policies_aws
}
