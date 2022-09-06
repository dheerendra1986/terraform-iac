# Service Account Module

**To create service account for any project and environment , use the module as described below**


```

module "batch-reprocess-readbq" {
  source     = "git::https://github.com/ingka-group-digital/ep_gcp_terraform_modules.git//modules/service-account?ref=main"
  project_id = var.project_name
  name       = "batch-reprocess-readbq"
  roles = [
    "roles/bigquery.admin",
    "roles/bigquery.dataOwner",
    "roles/bigquery.user"
  ]
}

```