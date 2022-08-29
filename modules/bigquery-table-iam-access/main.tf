resource "google_bigquery_table_iam_bindings" "table_viewer_role_bindings" {
  project    = var.project_id
  dataset_id = var.dataset_id
  table_id   = var.table_id
  role       = "roles/bigquery.dataviewer"
  members = [
    "amol.sudam.rathod1@ingka.com",
    "saumya.parui@ingka.com"
  ]
}

resource "google_bigquery_table_iam_bindings" "table_editor_role_bindings" {
  project    = var.project_id
  dataset_id = var.dataset_id
  table_id   = var.table_id
  role       = "roles/bigquery.dataEditor"
  members = [
    "dheerendra.kumar@ingka.com"
  ]
}
