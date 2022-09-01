variable "project" {
  description = "The ID of the google project to which the resource belongs. If it is not provided, the project configured in the gcloud client is used."
  default     = "ingka-icf-extcustdata-dev"
}

variable "project_id" {
  description = "The ID of the google project to which the resource belongs. If it is not provided, the project configured in the gcloud client is used."
}

variable "location" {
  description = "The GCS location. If it is not provided, the region configured in the gcloud client is used."
}
variable "folders" {
  description = "The list of folders to be created in the bucket"
  type        = list(any)
  default     = []
}
variable "name" {
  description = "The name of the bucket"
}

variable "pubsub_topic_notify" {
  description = ""
  default     = ""
}

variable "object_notify_prefix" {
  description = ""
  type        = list(any)
  default     = []
}

variable "storage_class" {
  description = "The Storage Class of the new bucket. Supported values are: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE."
  default     = "REGIONAL"
}

variable "force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all contained objects."
  default     = "false"
}

variable "versioning_enabled" {
  description = "While set to true, versioning is fully enabled for this bucket."
  default     = false
}

variable "lifecycle_rules" {
  description = ""
  type        = list(any)
  default     = []
}

variable "logging_enabled" {
  description = "When set to true, enable the bucket's Access and Storage Logs configuration and create a storage_bucket for them."
  default     = false
}

# ACLs
variable "default_acl" {
  description = "Configure this ACL to be the default ACL. See https://cloud.google.com/storage/docs/access-control/lists for more details."
  default     = "projectPrivate"
}

variable "bucket_public" {
  description = "When set to true, enable the allUsers group with read access"
  default     = false
}

variable "labels" {
  description = "A set of key/value label pairs to assign to the bucket."
  type        = map(string)
  default = {
    "managed-by" = "terraform"
  }
}

variable "members" {
  description = ""
  type        = list(string)
  default     = []
}

variable "members_object_admin" {
  description = ""
  type        = list(string)
  default     = []
}
