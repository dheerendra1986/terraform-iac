#zip up our source code

data "archive_file" "function_app_zip" {
  type        = "zip"
  source_dir  = "src"
  output_path = "/tmp/function.zip"

}
#create the storage bucket
resource "google_storage_bucket" "function_app_bucket" {
  project  = var.project_id
  name     = var.function_app_bucket_name
  location = var.bucket_location
  labels = {
    "environment" = "${var.label_environment}"
    "owner"       = "${var.label_owner}"
    "application" = "${var.label_application}"
    "created_on"  = "${replace(timestamp(), "/[- TZ:]/", "")}"
  }
  lifecycle {
    ignore_changes = [
      labels.created_on
    ]
  }
}

#place the zip-ed code in bucket
resource "google_storage_bucket_object" "function_app_zip" {
  source = data.archive_file.function_app_zip.output_path
  #name   = "${var.function_app_foldername}.zip"
  name   = "src-${data.archive_file.function_app_zip.output_md5}.zip"
  bucket = google_storage_bucket.function_app_bucket.name
  #source = "${path.root}/${var.function_app_foldername}.zip"
}

resource "google_cloudfunctions_function" "functions" {
  project               = var.project_id
  region                = var.function_app_region
  name                  = var.function_name
  description           = var.function_description
  service_account_email = var.function_app_service_account_email
  available_memory_mb   = var.function_available_memory_mb
  source_archive_bucket = google_storage_bucket.function_app_bucket.name
  source_archive_object = google_storage_bucket_object.function_app_zip.name
  timeout               = var.function_timeout
  entry_point           = var.function_entry_point
  trigger_http          = true
  runtime               = var.function_runtime
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
