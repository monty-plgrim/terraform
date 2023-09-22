groups = {
  "developers" = {
    name            = "developers"
    policies_inline = ["cloudwatch-logs-readonly", "s3-get-and-put-all-buckets"]
    policies_aws    = ["IAMReadOnlyAccess"]
  },
  "devops" = {
    name            = "devops"
    policies_inline = ["cloudwatch-logs-readonly"]
    policies_aws    = []
  }
}