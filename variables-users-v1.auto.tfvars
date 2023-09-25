users = {
  "plgrim_jane" = {
    name            = "jane"
    path            = "/plgrim/"
    email           = "monty@plgrim.com"
    groups          = ["developers", "devops"]
    policies_inline = []
    policies_aws    = []
  },
  "plgrim_adela" = {
    name            = "adela"
    path            = "/plgrim/"
    email           = "monty@plgrim.com"
    groups          = ["developers"]
    policies_inline = []
    policies_aws    = []
  }
  "plgrim_andrew" = {
    name            = "andrew"
    path            = "/plgrim/"
    email           = "monty@plgrim.com"
    groups          = ["devops"]
    policies_inline = ["s3-get-and-put-all-buckets"]
    policies_aws    = ["AdministratorAccess"]
  }
}