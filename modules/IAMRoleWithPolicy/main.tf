resource "aws_iam_role_policy" "inline_policies" {
  for_each = var.roles

  name   = each.value.name
  role   = aws_iam_role.roles[each.key].name
  policy = data.aws_iam_policy_document.inline_policy[each.key].json
}

data "aws_iam_policy_document" "inline_policy" {
  for_each = var.roles

dynamic "statement" {
  for_each = each.value.policy_statements

  content {
    effect    = try(each.value.effect, "Allow")
    actions   = try(each.value.actions, [])
    resources = try(each.value.resources, ["*"])
  }
}

}

