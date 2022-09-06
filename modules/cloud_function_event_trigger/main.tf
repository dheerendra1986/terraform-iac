#zip up our source code
data "archive_file" "function_app_zip" {
  type        = "zip"
  source_dir  = "${path.root}/${var.function_app_foldername}"
  output_path = "${path.root}/${var.functiom_app_foldername}.zip"
}

#create the storage bucket

resource "google_storage_bucket" "function_app_bucket" {
  name                        = var.function_app_bucket_name
  uniform_bucket_level_access = true
  labels = {
    environment = "${var.label_environment}"
    owner       = "${var.label_owner}"
    application = "${var.label_application}"
    created_on  = "${replace(timestamp(), "/[- TZ:]/", "")}"
  }
  lifecycle {
    ignore_changes = [
      labels.created_on
    ]
  }
}

#place the zip ed code in the bucket

resource "google_storage_bucket_object" "function_app_zip" {
  name   = "${var.function_app_foldername}.zip"
  bucket = google_storage_bucket.function_app_bucket.name
  source = "${path.root}/${var.function_app_foldername}.zip"
}

resource "google_cloudfunctions_function" "functions" {
  region                = var.function_app_region
  name                  = var.function_name
  description           = var.function_description
  service_account_email = var.function_app_service_account_email
  available_memory_mb   = var.function_available_memory_mb
  source_archive_bucket = google_storage_bucket.function_app_bucket.name
  source_archive_object = google_storage_bucket_object.function_app_zip.name
  timeout               = var.function_timeout
  entry_point           = var.function_entry_point
  event_trigger {
    event_type = var.event_trigger_event_type
    resource   = var.event_trigger_resource
    failure_policy {
      retry = var.failure_retry_policy
    }
  }
  runtime = var.function_runtime
  labels = {
    "environment" = "${var.label_environment}"
    owner         = "${var.label_owner}"
    application   = "${var.label_application}"
    created_on    = "${replace(timestamp(), "/[- TZ:]/", "")}"
  }
  lifecycle {
    ignore_changes = [
      labels.created_on
    ]
  }
  environment_variables = var.environemnt_variables
}

resource "google_cloudfunctions_function_iam_member" "invoker" {
  region         = var.function_app_region
  cloud_function = google_cloudfunctions_function.functions.name
  role           = "roles/cloudfunctions.invoker"
  member         = "serviceAccount:${var.function_app_service_account_email}"
}
