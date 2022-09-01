resource "google_project_service" "enable_apies" {

  for_each           = toset(var.enable_api_services)
  service            = each.value
  project            = var.project_id
  disable_on_destroy = false
}
