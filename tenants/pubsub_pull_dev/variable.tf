variable "project_pubsub" {
  default = "ingka-icf-extcustdata-test"
}

variable "region" {
  default = "us-east1"
}

variable "project_name" {
  default = "ingka-icf-extcustdata-test"
}

variable "pubsub_topics" {
  type    = list(string)
  default = []
}


variable "pubsub_subscriptions_ack_deadline_seconds" {
  type = map(string)
}

variable "pubsub_topic_iam_binding" {
}

variable "pubsub_subscription_iam_binding" {
}

variable "pubsub_pull_subscription_iam_binding" {
}

variable "create_topic" {
  type        = bool
  description = "Specify true if you want to create a topic"
  default     = true
}

variable "push_subscriptions" {
  type        = list(map(string))
  description = "The list of the push subscriptions"
}


variable "pull_subscriptions" {
  type        = list(map(string))
  description = "The list of the pull subscriptions"
}
