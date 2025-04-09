module "new_policy_attachment" {
  source = "./modules/IAMRolePolicyAttachment"

  role_policy_attachment = {
    BUAdministratorRole = {
      role_name = module.new_roles.human_roles["BUAdministratorRole"].name
      policy_arns = [
        "arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess"
      ]
      policy_names =  [
        "S3ReadOnlyPolicy", 
        "S3ReadOnlyPolicyNew", 
        "TestPolicy1"]
    }


    BUAdministratorRoleNew = {
      role_name = module.new_roles.human_roles["BUAdministratorRoleNew"].name
      policy_arns = [
        "arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess"
      ]
      policy_names = [
        "S3ReadOnlyPolicy", 
        "S3ReadOnlyPolicyNew",  
        "EC2DescribePolicy", 
        "TestPolicy", 
        "TestPolicy1" ]
    }

    BUTestRole1 = {
      role_name = module.new_roles.human_roles["BUTestRole1"].name
      policy_arns = [
        "arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess"
      ]
      policy_names = [
      "S3ReadOnlyPolicy",
       "S3ReadOnlyPolicyNew",  
       "EC2DescribePolicy", 
       "TestPolicy", 
       "TestPolicy1", 
       "TestPolicy2" ]
    }

  }


  custom_policy_arns = module.new_policy.iam_policy_arns
}