output "iam_role_names" {
  description = "List of IAM Role Names"
  value       = [for role in aws_iam_role.roles : role.name]
}

output "iam_inline_policies" {
  description = "List of IAM Inline Policies"
  value       = { for k, v in aws_iam_role_policy.inline_policies : k => v.name }
}
