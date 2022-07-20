terraform {
  backend "gcs" {
    bucket = "ingka-icf-extcustdata-test-tfstate"
    prefix = "env/prod"
  }
}
