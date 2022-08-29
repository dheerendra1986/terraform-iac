locals {
  default_ack_deadline_seconds = 10

  topics = flatten([
    for topic1 in var.topics : {
      topic_name = topic1
    }
  ])
}

resource "google_pubsub_subscription_iam_binding" "subscription_iam_binding" {
  count        = length(var.pubsub_subscription_iam_binding)
  subscription = var.pubsub_subscription_iam_binding[count.index].subscription
  role         = var.pubsub_subscription_iam_binding[count.index].role
  members      = var.pubsub_subscription_iam_binding[count.index].members

  depends_on = ["google_pubsub_subscription.pull_subscriptions"]
}

resource "google_pubsub_subscription" "pull_subscriptions" {
  count   = length(var.subscriptions)
  name    = var.subscriptions[count.index].name
  topic   = local.topics[0].topic_name
  project = var.project
  ack_deadline_seconds = lookup(
    var.subscriptions[count.index],
    "ack_deadline_seconds",
    local.default_ack_deadline_seconds,
  )
  #depends_on = ["google_pubsub_topic.topic"]
  #depends_on = [module.pubsub.google_pubsub_topic.topic.0.*]
  depends_on = [var.topics]
}

