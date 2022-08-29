locals {
  default_ack_deadline_seconds = 10

  topics = flatten([
    for topic1 in var.topics : {
      topic_name = topic1
    }
  ])
}

resource "google_pubsub_topic" "topic" {
  #count   = var.create_topic ? 1 : 0
  count = length(local.topics)
  name    = local.topics[count.index].topic_name
  project = var.project
  #labels  = [for l in var.labels: upper(l)]
  #labels   = "{var.labels}"
}



resource "google_pubsub_subscription" "push_subscriptions" {
  count   = length(var.subscriptions)
  name    = var.subscriptions[count.index].name
  topic   = local.topics[0].topic_name
  project = var.project
  ack_deadline_seconds = lookup(
  var.subscriptions[count.index],
  "ack_deadline_seconds",
  local.default_ack_deadline_seconds,
  )

  expiration_policy {
    ttl = ""
  }

  push_config {
    oidc_token {
      service_account_email = var.subscriptions[count.index]["service_account_email"]
    }
    push_endpoint = var.subscriptions[count.index]["push_endpoint"]
    attributes = {
      x-goog-version = lookup(var.subscriptions[count.index], "x-goog-version", "v1")
    }
  }

  depends_on = ["google_pubsub_topic.topic"]
  #depends_on = ["module.pubsub_pull.google_pubsub_topic.topic."]
}



resource "google_pubsub_topic_iam_binding" "topic-iam-binding" {
  count   = length(var.pubsub_topic_iam_binding)
  project = "${var.project}"
  topic   = "${var.pubsub_topic_iam_binding[count.index].topic}"
  role    = "${var.pubsub_topic_iam_binding[count.index].role}"
  members = "${var.pubsub_topic_iam_binding[count.index].members}"
  depends_on = [google_pubsub_topic.topic]
#depends_on = ["module.pubsub_pull.google_pubsub_topic.topic"]
}


resource "google_pubsub_subscription_iam_binding" "subscription_iam_binding" {
  count   =      length(var.pubsub_subscription_iam_binding)
  subscription = "${var.pubsub_subscription_iam_binding[count.index].subscription}"
  role         = "${var.pubsub_subscription_iam_binding[count.index].role}"
  members      = "${var.pubsub_subscription_iam_binding[count.index].members}"

  depends_on = ["google_pubsub_subscription.push_subscriptions"]
}
