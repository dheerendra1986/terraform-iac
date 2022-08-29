terraform {
  backend "gcs" {
    bucket = "ingka-icf-extcustdata-test-tfstate"
    prefix = "env/test"
  }
}


module "batch-reprocess-readbq" {
  source     = "../../modules/service-account"
  project_id = var.project_name
  name       = "batch-reprocess-readbq"
  roles = [
    "roles/bigquery.admin",
    "roles/bigquery.dataOwner",
    "roles/bigquery.user"
  ]
}

module "consume-signup-checkout-events" {
  source     = "../../modules/service-account"
  project_id = var.project_name
  name       = "consume-signup-checkout-events"
  roles = [
    "roles/bigquery.dataEditor",
    "roles/logging.logWriter",
    "roles/secretmanager.secretAccessor",
    "roles/run.invoker"
  ]

}
