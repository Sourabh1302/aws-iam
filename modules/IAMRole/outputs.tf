# output "role_arn" {
#   description = "ARN of the created IAM role"
#   value = aws_iam_role.okta_roles.arn
# }

# output "role_name" {
#   description = "Name of the created IAM role"
#   value = aws_iam_role.okta_roles.name
# }

output "human_roles" {
  value = { for k, v in aws_iam_role.human_roles : k => v }
}

# output "role_name" {
#   value = module.new_roles.human_roles["BUAdministratorRole"].name
# }

