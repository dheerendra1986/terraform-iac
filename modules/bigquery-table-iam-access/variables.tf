variable "project_id" {
  type        = string
  description = "Variable for Project ID."
  default     = "ingka-icf-extcustdata-test"
}

variable "dataset_id" {
  type        = string
  description = "Variable for dataset in project."
  default     = "ingka-icf-extcustdata-test"
}

variable "table_id" {
  type        = list(any)
  description = "Variable for dataset in project."
  default     = "ingka-icf-extcustdata-test"
}