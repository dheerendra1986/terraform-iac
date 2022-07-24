terraform {
  backend "gcs" {
    bucket = "ingka-icf-extcustdata-dev-tfstate"
    prefix = "env/dev"
  }
}
