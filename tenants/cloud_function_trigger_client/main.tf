module "cloud_functions" {
  source                             = "../../modules/cloud_function_event_trigger"
  functiom_app_foldername            = "hello_world"
  function_app_bucket_name           = "function_app"
  function_app_region                = "us-east1"
  function_name                      = "pubsub_event_demo"
  function_description               = "Dummy function test"
  function_app_service_account_email = "ingka-icf-extcustdata-test@appspot.gserviceaccount.com"
  function_available_memory_mb       = "256"
  function_timeout                   = "60"
  function_runtime                   = "python37"
  event_trigger_event_type           = "providers/cloud.pubsub/eventTypes/topic.publish"
  event_trigger_resource             = "cloud_function_test" #google pub sub topic name
  failure_retry_policy               = false
  function_entry_point               = "pubsub_event"
  project_name                       = "ingka-icf-extcustdata-test"
  bucket_location                    = "US"
  environemnt_variables = {
    PUB_SUB_NAME = "cloud_function_test"
  }
  label_environment = "environment"
  label_owner       = "owner"
  label_application = "ecd"

}
