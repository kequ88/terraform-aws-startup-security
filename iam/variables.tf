# iam/variables.tf
variable "user_names" {
  description = "List of IAM users to create"
  type        = list(string)
  default     = [
    "alice-admin",
    "dana-dev",
    "eric-dev",
    "fay-dev",
    "greg-dev",
    "hana-dev",
    "bob-qa",
    "charlie-ops"
  ]
}

variable "dev_users" {
  description = "List of developer users"
  type        = list(string)
  default     = [    "dana-dev","eric-dev","fay-dev","greg-dev","hana-dev",]
}

variable "admin_users" {
  description = "List of admin users"
  type        = list(string)
  default     = ["alice-admin"]
}

variable "qa_users" {
  description = "List of QA users"
  type        = list(string)
  default     = ["bob-qa"]
}

variable "ops_users" {
  description = "List of ops users"
  type        = list(string)
  default     = ["charlie-ops"]
}
