module "pubsub_pull" {
  source                          = "../../modules/pubsub_pull"
  project                         = var.project_pubsub
  subscriptions                   = var.pull_subscriptions
  topics                          = module.pubsub.topic
  ack_deadline_seconds            = var.pubsub_subscriptions_ack_deadline_seconds
  pubsub_subscription_iam_binding = var.pubsub_pull_subscription_iam_binding
}
