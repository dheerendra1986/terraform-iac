module "bq_table_iam_member_viewer" {
  source             = "../../modules/bigquery-table-iam-access"
  project_id         = "ingka-icf-extcustdata-test"
  dataset_id         = "event_logs"
  bigquery_table_id  = ["invoice", "invoices"]
  account_type       = "user" # account-type -  user,serviceAccount,group,domain
  user_email_address = "amol.sudam.rathod1@ingka.com"
  user_role          = "roles/bigquery.dataEditor"
}
