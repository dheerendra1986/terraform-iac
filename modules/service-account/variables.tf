variable "roles" {
  type        = list(string)
  description = "List of roles that service account should be member of"
}

variable "name" {
  type        = string
  description = "Name of the service account"
}

variable "service_account" {
  type        = string
  description = "Service account used for accessing resources"
  default     = ""
}

variable "project_id" {} 
