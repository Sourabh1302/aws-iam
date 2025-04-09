resource "aws_iam_role_policy_attachment" "custom_policy_attachment" {
  for_each = merge([
    for role_key, role_data in var.role_policy_attachment : {
      for policy_name in lookup(role_data, "policy_names", []) :
      "${role_key}_${policy_name}" => {
        role_name   = role_data.role_name
        policy_arn = var.custom_policy_arns[policy_name]
      }
    }
  ]...)

  role       = each.value.role_name
  policy_arn = each.value.policy_arn

}

resource "aws_iam_role_policy_attachment" "aws_managed_policy_attachment" {
  for_each = merge([
    for role_key, role_data in var.role_policy_attachment : {
      for policy_arn in lookup(role_data, "policy_arns", []) :
      "${role_key}_${replace(policy_arn, ":", "_")}" => {
        role_name  = role_data.role_name
        policy_arn = policy_arn
      }
    }
  ]...)

  role       = each.value.role_name
  policy_arn = each.value.policy_arn
 
}
