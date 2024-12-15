# Create topics for each name in the topics list
resource "google_pubsub_topic" "default" {
  for_each = toset(var.topics)

  name = each.value
}

resource "google_pubsub_subscription" "default" {
  for_each = { for s in var.subscriptions : s.subscription_name => s if contains(var.topics, s.topic_name) }

  name                       = each.value.subscription_name
  topic                      = google_pubsub_topic.default[each.value.topic_name].name
  ack_deadline_seconds       = each.value.ack_deadline_seconds
}

output "topic_names" {
  value = values(google_pubsub_topic.default)[*].name
}

output "subscription_names" {
  value = values(google_pubsub_subscription.default)[*].name
}

