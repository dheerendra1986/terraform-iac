

resource "google_service_account" "service_account" {
  account_id   = var.name
  display_name = "${title(var.name)} Service Account"
}

resource "google_project_iam_member" "iam_member" {
  project    = var.project_id
  count      = length(var.roles)
  role       = element(var.roles, count.index)
  member     = "serviceAccount:${google_service_account.service_account.email}"
  depends_on = [google_service_account.service_account]
}
