module "aws" {
  source          = "./aws"
  users           = var.users
  policies_inline = var.policies_inline
  policies_aws    = var.policies_aws
  groups          = var.groups
}
