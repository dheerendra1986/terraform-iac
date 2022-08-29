variable "project" {
  description = "The ID of the google project to which the resource belongs. If it is not provided, the project configured in the gcloud client is used."
  default     = "ingka-icf-extcustdata-dev"
}

variable "location" {
  description = "The GCS location. If it is not provided, the region configured in the gcloud client is used."
  default     = "europe-west1"
}

variable "name" {
  description = "The name of the bucket"
  default     = "ecd-test-storage-tfstate"
}
