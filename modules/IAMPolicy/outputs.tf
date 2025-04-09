output "iam_policy_arns" {
  value = { for k, v in aws_iam_policy.custom_policies : k => v.arn }
}
