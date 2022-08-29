module "bucket-creation" {
  source = "../../modules/storage-bucket"
  bucket_name = var.name
}
