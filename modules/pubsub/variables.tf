
variable "project" {
  type        = string
  description = "The project ID to manage the Pub/Sub resources"
}

variable "topics" {
  type   = list
  default = []
  description = "The Pub/Sub topic name"
}

variable "create_topic" {
  type        = bool
  description = "Specify true if you want to create a topic"
  default     = true
}



variable "subscriptions" {
  type        = list(map(string))
  description = "The list of the push subscriptions"
}
variable "pubsub_topic_iam_binding" {
}

variable "pubsub_subscription_iam_binding" {
}

//variable "pubsub_pull_subscription_iam_binding" {
//}

variable "ack_deadline_seconds" {}

variable "members" {
  type = set(string)
  default = []
}