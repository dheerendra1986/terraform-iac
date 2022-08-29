terraform {
  backend "gcs" {
    bucket = "ecd-dev-storage-tfstate"
    prefix = "terraform/state/dev/"
  }
}
