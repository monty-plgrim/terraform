module "aws" {
  source          = "./aws"
  users           = var.users
  policies_inline = var.policies_inline
  policies_aws    = var.policies_aws
  groups          = var.groups
}
module "welcome" {
  source     = "git::https://github.com/cloudposse/terraform-null-smtp-mail.git"
  host       = "smtp.mailgun.org"
  port       = "587"
  username   = "monty@plgrim.com"
  password   = "dhgkswls707!"
  from       = "monty@plgrim.com"
  to         = ["dhgkswls707!"]
  subject    = "Welcome testtest"
  body       = "Your account has been created. Login here: testtest"
#
#  vars = {
#    first_name = "Example"
#    homepage   = "https://cloudposse.com"
#  }
}