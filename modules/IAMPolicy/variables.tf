variable "policies" {
  description = "Map of custom policy definitions"
  type = map(object({
    name      = string
    path      = string
    statements = list(object({
      effect    = optional(string, "Allow")
      actions   = list(string)
      resources = optional(list(string), ["*"])
    }))
  }))
}
