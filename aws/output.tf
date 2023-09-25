output "test2" {
  value     = module.iam.selected_access_keys
  sensitive = true
}