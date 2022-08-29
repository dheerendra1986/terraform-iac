variable "project" {
  type        = string
  description = "The project ID to manage the Pub/Sub resources"
}
variable "subscriptions" {
  type        = list(map(string))
  description = "The list of the push subscriptions"
}
variable "pubsub_subscription_iam_binding" {
}
variable "ack_deadline_seconds" {}
variable "members" {
  type    = set(string)
  default = []
}

variable "topics" {}
