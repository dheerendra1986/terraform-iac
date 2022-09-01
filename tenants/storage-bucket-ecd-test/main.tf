module "bucket-creation" {
  source        = "../../modules/storage-bucket"
  name          = var.bucket_name
  project_id    = var.project
  location      = var.location
  storage_class = var.storage_class
}
