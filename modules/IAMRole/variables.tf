# variable "okta_roles" {
#   description = "List of OKta IAM roles to create"

#   type = map(object({

#     name = string
#     path = string
   
#     principals = list(object({
#       identifiers = list(string)

#       }))
#     }))

# }


variable "human_roles" {
  type = map(object({
    name       = string
    path       = string
    principals = list(string)
    conditions = optional(list(object({
      test     = string
      variable = string
      values   = list(string)
    })))
  }))
}



