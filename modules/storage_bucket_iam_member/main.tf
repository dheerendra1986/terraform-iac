resource "google_storage_bucket_iam_member" "storage_bucket_member" {
  bucket = var.storage_bucket_name
  count  = length(var.user_role)
  role   = var.user_role[count.index]
  member = "${var.account_type}:${var.user_email_address}"

}
