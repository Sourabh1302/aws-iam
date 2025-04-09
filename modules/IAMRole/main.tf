# resource "aws_iam_role" "okta_roles" {

#     for_each = var.okta_roles

#     name = each.value.name
#     path = each.value.path
#     assume_role_policy = data.aws_iam_policy_document.role_policy[each.key].json
# }


# data "aws_iam_policy_document" "role_policy" {

#     for_each = var.okta_roles

#     statement {

#         effect =  "Allow"
#         actions = ["sts:AssumeRoleWithSAML"]

#         principals {
#             type = ""Federated""
#             identifiers = each.value.principals.identifiers
#           }
#         }

#         condition {
                    
#         test = "StringEquals"
#         variable = "SAML:aud"
#         values = ["https://signin.aws.amazon.com/saml"]
#           }
#         }
#       }
# }


resource "aws_iam_role" "human_roles" {
  for_each = var.human_roles

  name               = each.value.name
  path               = each.value.path
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy[each.key].json
}

data "aws_iam_policy_document" "assume_role_policy" {
  for_each = var.human_roles

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = each.value.principals
    }

    dynamic "condition" {
      for_each = try(each.value.conditions, [])

      content {
        test     = condition.value.test
        variable = condition.value.variable
        values   = condition.value.values
      }
    }
  }
}

