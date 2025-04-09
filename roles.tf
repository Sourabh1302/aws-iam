module "new_roles" {
  source = "./modules/IAMRole"

  human_roles = {
    "BUAdministratorRole" = {
      name = "BUAdministratorRole"
      path = "/"

      principals = ["arn:aws:iam::339712960538:user/Sourabh"]

      conditions = [{
        test     = "StringEquals"
        variable = "aws:username"
        values   = ["Sourabh"]
      }]
    }


    "BUAdministratorRoleNew" = {
      name = "BUAdministratorRoleNew"
      path = "/"

      principals = ["arn:aws:iam::339712960538:user/Sourabh"]

      conditions = [{
        test     = "StringEquals"
        variable = "aws:username"
        values   = ["Sourabh"]
      }]
    }

    "EC2DescribeRole" = {
      name = "EC2DescribeRole"
      path = "/"

      principals = ["arn:aws:iam::339712960538:user/Sourabh"]

      conditions = [{
        test     = "StringEquals"
        variable = "aws:username"
        values   = ["Sourabh"]
      }]
    }

    "BUTestRole1" = {
      name = "BUTestRole1"
      path = "/"

      principals = ["arn:aws:iam::339712960538:user/Sourabh"]

      conditions = [{
        test     = "StringEquals"
        variable = "aws:username"
        values   = ["Sourabh"]
      }]
    }
  }
}