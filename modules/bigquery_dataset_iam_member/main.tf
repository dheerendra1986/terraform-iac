/******************************************
Dataset IAM permissions
 *****************************************/
resource "google_bigquery_dataset_iam_member" "dataset_iam_member" {
  for_each   = toset(var.bigquery_dataset_friendly_name)
  dataset_id = each.value
  role       = var.user_role
  member     = "${var.account_type}:${var.user_email_address}"
}
