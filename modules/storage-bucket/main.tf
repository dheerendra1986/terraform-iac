# Pull information from current gcloud client config
data "google_client_config" "default" {}
data "google_client_config" "current" {}


locals {
  bucket_name = var.name == "" ? format("%s-%s", local.project_id, random_id.default.dec) : var.name
  project_id  = var.project_id == "" ? data.google_client_config.default.project : var.project_id

}

resource "random_id" "default" {
  byte_length = 2
}
resource "google_storage_bucket" "bucket" {
  name          = local.bucket_name
  location      = var.location != "" ? var.location : data.google_client_config.current.region
  project       = var.project != "" ? var.project : data.google_client_config.current.project
  storage_class = var.storage_class
  force_destroy = var.force_destroy
  labels        = var.labels

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      dynamic "action" {
        for_each = lookup(lifecycle_rule.value, "action", [])
        content {
          storage_class = lookup(action.value, "storage_class", null)
          type          = action.value.type
        }
      }
      dynamic "condition" {
        for_each = lookup(lifecycle_rule.value, "condition", [])
        content {
          age                   = lookup(condition.value, "age", null)
          created_before        = lookup(condition.value, "created_before", null)
          matches_storage_class = lookup(condition.value, "matches_storage_class", null)
          num_newer_versions    = lookup(condition.value, "num_newer_versions", null)
          with_state            = lookup(condition.value, "with_state", null)
        }
      }
    }
  }
}
resource "google_storage_bucket_iam_binding" "bucket_iam_binding" {
  bucket     = local.bucket_name
  role       = "roles/storage.admin"
  members    = var.members
  depends_on = [google_storage_bucket.bucket]
}
resource "google_storage_bucket_iam_binding" "bucket_object_admin_iam_binding" {
  count      = length(var.members_object_admin) > 0 ? 1 : 0
  bucket     = local.bucket_name
  role       = "roles/storage.objectAdmin"
  members    = var.members_object_admin
  depends_on = [google_storage_bucket.bucket]
}
