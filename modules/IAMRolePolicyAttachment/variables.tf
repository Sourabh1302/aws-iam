variable "role_policy_attachment" {
  description = "Map of role name to list of policies"
  type = map(object({
    role_name    = string
    policy_arns  = optional(list(string), [])
    policy_names = optional(list(string), [])
  }))
}

variable "custom_policy_arns" {
  description = "Map of custom policy names to their ARNs"
  type        = map(string)
  default     = {}
}

variable "depends_on_roles" {
  type    = any
  default = []
}
