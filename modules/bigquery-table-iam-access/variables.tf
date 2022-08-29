variable "project_id" {
  type        = string
  description = "Variable for Project ID."
  default     = "ingka-icf-extcustdata-test"
}

variable "dataset_id" {
  type        = string
  description = "Variable for dataset in project."
}

variable "bigquery_table_id" {
  type        = list(any)
  description = "Variable for dataset in project."
}

variable "user_email_address" {}
variable "account_type" {}
variable "user_role" {}
