resource "google_cloud_run_service_iam_member" "member_cloud_run" {
  count    = length(var.user_role)
  location = var.location
  project  = var.project_name
  service  = var.cloud_run_name
  role     = var.user_role[count.index]
  member   = "${var.account_type}:${var.user_email_address}"
}
