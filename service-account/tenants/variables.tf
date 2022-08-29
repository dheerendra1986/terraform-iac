terraform {
  backend "gcs" {
    bucket = ""
    prefix = ""
  }
}

provider "google-beta" {
  project = var.project_name
}

provider "google" {
  project = var.project_name
}


module "sa_topic" {
  source = "../modules/service-account"
  name   = "pcid-pubsub-topic-prod"
  roles = [
    "roles/pubsub.publisher"
  ]
}

module "sa_subscription" {
  source = "../../modules/service-account"
  name   = "pcid-pubsub-subscription-prod"
  roles = [
    "roles/pubsub.subscriber"
  ]
}
