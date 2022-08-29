module "storage_bucket_iam_permission_01" {
  source              = "../../modules/storage_bucket_iam_member"
  storage_bucket_name = "test"
  user_role           = ["roles/storage.objectViewer"]
  account_type        = "user" # account type can be user,serviceAccount,domain 
  user_email_address  = "dheerendra.kumar@ingka.com"
}
