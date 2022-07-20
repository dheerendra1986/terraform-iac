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
  role_id              = "iamrolefordeleter"
  base_roles           = ["roles/iam.serviceAccountAdmin"]
  permissions          = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
  excluded_permissions = ["iam.serviceAccounts.setIamPolicy", "resourcemanager.projects.get", "resourcemanager.projects.list"]
  description          = "This is a project level custom role."
  members              = ["serviceAccount:custom-role-account-01@${var.project_id}.iam.gserviceaccount.com", "serviceAccount:custom-role-account-02@${var.project_id}.iam.gserviceaccount.com"]
}

/******************************************
  Create service accounts to use as members
 *****************************************/
resource "google_service_account" "custom_role_account_01" {
  account_id = "custom-role-account-prod"
  project    = var.project_id
}

