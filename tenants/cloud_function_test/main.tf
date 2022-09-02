module "cloud_function" {
  source                             = "../../modules/cloud_function"
  function_app_foldername            = "src"
  function_app_bucket_name           = "function_app"
  function_app_region                = "us-east1"
  function_name                      = "hello-world"
  function_description               = "Dummy function to test the cloud function"
  function_app_service_account_email = "ingka-icf-extcustdata-test@appspot.gserviceaccount.com"
  function_available_memory_mb       = "256"
  function_timeout                   = "60"
  function_entry_point               = "hello_world"
  function_runtime                   = "python37"
  label_environment                  = "environment"
  label_owner                        = "dheerendra"
  label_application                  = "ecd"
  bucket_location                    = "EU"
  project_id                         = "ingka-icf-extcustdata-test"
}
