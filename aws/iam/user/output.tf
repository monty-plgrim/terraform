output "access_key_keys" {
  value = {
      user_name         = aws_iam_user.this.name
      access_key_id     = aws_iam_access_key.this.id
      secret_access_key = aws_iam_access_key.this.secret
      password          = aws_iam_user_login_profile.this.password
      email             = var.email
    }
}