resource "google_bigquery_table_iam_member" "table_iam_member" {
  for_each   = toset(var.bigquery_table_id)
  project    = var.project_id
  dataset_id = var.dataset_id
  table_id   = each.value
  role       = var.user_role
  member     = "${var.account_type}:${var.user_email_address}"
}
