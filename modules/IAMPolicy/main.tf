data "aws_iam_policy_document" "custom_policy" {
  for_each = var.policies

  statement {
    effect    = try(each.value.statements[0].effect, "Allow")
    actions   = try(each.value.statements[0].actions, [])
    resources = try(each.value.statements[0].resources, ["*"])
  }
}

resource "aws_iam_policy" "custom_policies" {
  for_each = var.policies

  name   = each.value.name
  path   = each.value.path
  policy = data.aws_iam_policy_document.custom_policy[each.key].json
}
