module "new_policy" {
  source = "./modules/IAMPolicy"

  policies = {
    "S3ReadOnlyPolicy" = {
      name = "S3ReadOnly"
      path = "/"
      statements = [{
        effect    = "Allow"
        actions   = ["s3:ListBucket"]
        resources = ["arn:aws:s3:::terraform-state-250225"]
      }]
    }


    "S3ReadOnlyPolicyNew" = {
      name = "S3ReadOnlyNew"
      path = "/"
      statements = [{
        effect    = "Allow"
        actions   = ["s3:ListBucket"]
        resources = ["arn:aws:s3:::terraform-state-250225"]
      }]
    }


    "S3ReadOnlyPolicyNew1" = {
      name = "S3ReadOnlyNew1"
      path = "/"
      statements = [{
        effect    = "Allow"
        actions   = ["s3:ListBucket"]
        resources = ["arn:aws:s3:::terraform-state-250225"]
      }]
    }



    "EC2DescribePolicy" = {
      name = "EC2DescribePolicy"
      path = "/"
      statements = [{
        effect    = "Allow"
        actions   = ["ec2:Describe*"]
        resources = ["*"]
      }]
    }

    "DynamoDBDescribePolicy" = {
      name = "DynamoDBDescribePolicy"
      path = "/"
      statements = [{
        effect    = "Allow"
        actions   = ["dynamodb:Describe*"]
        resources = ["*"]
      }]
    }

    "TestPolicy" = {
      name = "TestPolicy"
      path = "/"
      statements = [{
        effect = "Allow"
        actions = ["dynamodb:Describe*",
        "ec2:Describe*"]
        resources = ["*"]
      }]
    }

    "TestPolicy1" = {
      name = "TestPolicy1"
      path = "/"
      statements = [{
        effect = "Allow"
        actions = ["dynamodb:Describe*",
        "ec2:Describe*"]
        resources = ["*"]
      }]
    }

    "TestPolicy2" = {
      name = "TestPolicy2"
      path = "/"
      statements = [{
        effect = "Allow"
        actions = ["dynamodb:Describe*",
        "ec2:Describe*"]
        resources = ["*"]
      }]
    }
  }
}