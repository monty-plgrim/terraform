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
  depends_on = [data.aws_iam_policy.policies_inline_with_arn]
}


resource "null_resource" "user_info_to_csv" {
  for_each = module.user
  provisioner "local-exec" {
    command = "echo username,AccessKeyId,SecretAccessKey,Password >> $user_name.csv\necho $user_name,$access_key_id,$secret_access_key,$password >> $user_name.csv"

    environment = {
      user_name         = each.value.iam_user_info.user_name
      access_key_id     = each.value.iam_user_info.access_key_id
      secret_access_key = each.value.iam_user_info.secret_access_key
      password          = each.value.iam_user_info.password
      email             = each.value.iam_user_info.email
    }
  }
  depends_on = [module.user.iam_user_info]
}

resource "null_resource" "ready_to_send_email" {
  provisioner "local-exec" {
    command = "sudo apt-get install sendemail"
  }
}

resource "null_resource" "send_email_to_user" {
  for_each = module.user
  provisioner "local-exec" {
    command = "sendemail -f rnddesk@plgrim.com -t $email -u \"Plgrim RND IAM Identities\" -m \"Please Check .csv file\" -s smtp.gmail.com -a $user_name.csv -xu rnddesk@plgrim.com -xp \"plgrim0829@@\""

    environment = {
      user_name = each.value.iam_user_info.user_name
      email     = each.value.iam_user_info.email
    }
  }

  depends_on = [
    null_resource.user_info_to_csv
  ]
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

  depends_on = [data.aws_iam_policy.policies_inline_with_arn]
}
