variable "roles" {
  description = "IAM roles with inline policies"
  type = map(object({
    name              = string
    path              = optional(string, "/")
    policy_statements = list(object({
      effect    = optional(string, "Allow")
      actions   = list(string)
      resources = list(string)
    }))
  }))
}
