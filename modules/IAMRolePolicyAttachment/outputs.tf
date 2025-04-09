output "custom_role_policy_attachments" {
  value = {
    for k, v in aws_iam_role_policy_attachment.custom_policy_attachment : k => v.id
  }
}

