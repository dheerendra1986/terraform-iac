module "dataset_iam_member_01" {
  source                         = "../../modules/bigquery_dataset_iam_member"
  project_id                     = "ingka-icf-extcustdata-test"
  bigquery_dataset_friendly_name = ["data_quality_mart", "data_quality_overview"]
  account_type                   = "user" # account_type - user,serviceAccount,group,domain
  user_email_address             = "dheerendra.kumar@ingka.com"
  user_role                      = "roles/bigquery.dataEditor"
}


module "dataset_iam_member_02" {
  source                         = "../../modules/bigquery_dataset_iam_member"
  project_id                     = "ingka-icf-extcustdata-test"
  bigquery_dataset_friendly_name = ["extended_customer_date", "data_quality_overview"]
  account_type                   = "user" # account_type - user,serviceAccount,group,domain
  user_email_address             = "dheerendra.kumar@ingka.com"
  user_role                      = "roles/bigquery.dataEditor"
}
