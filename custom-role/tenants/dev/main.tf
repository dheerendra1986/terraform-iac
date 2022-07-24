provider "google" {
  project = var.project_id
}

/******************************************
  Module custom_role call
 *****************************************/
module "custom-role-project" {
  source = "../../modules/custom_role_iam/"

  target_level         = "project"
  target_id            = var.project_id
  role_id              = "iamDeleterDev"
  base_roles           = ["roles/iam.serviceAccountAdmin"]
  permissions          = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
  excluded_permissions = ["iam.serviceAccounts.setIamPolicy", "resourcemanager.projects.get", "resourcemanager.projects.list"]
  description          = "This is a project level custom role."
  members              = ["serviceAccount:${var.service_account_name_01}@${var.project_id}.iam.gserviceaccount.com", "serviceAccount:${var.service_account_name_02}@${var.project_id}.iam.gserviceaccount.com"]
}

/******************************************
  Create service accounts to use as members
 *****************************************/
resource "google_service_account" "custom_role_account_dev-test01" {
  account_id = var.service_account_name_01
  project    = var.project_id
}

resource "google_service_account" "custom_role_account_dev-test02" {
  account_id = var.service_account_name_02
  project    = var.project_id
}
