variable "project_id" {
  type        = string
  description = "Variable for Project ID."
  default     = "ingka-icf-extcustdata-test"
}

variable "service_account_name_01"{
  type = string
  description = "Name of the service account"
  default = "custom_role_account_dev_test01"

}

variable "service_account_name_02"{
  type = string
  description = "Name of the service account"
  default = "custom_role_account_dev_test02"
}