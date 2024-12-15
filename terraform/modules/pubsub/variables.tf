variable "topics" {
  description = "List of Pub/Sub topics to create"
  type        = list(string)
}

variable "subscriptions" {
  description = "Optional list of subscription configurations"
  type = list(object({
    topic_name           = string
    subscription_name    = string
    ack_deadline_seconds = number
  }))
  default = []
}


variable "ack_deadline_seconds" {
  description = "Acknowledgment deadline in seconds for the subscription"
  type        = number
  default     = 10
}

variable "region" {
  description = "Region for the Pub/Sub resources (if applicable)"
  type        = string
  default     = "us-central1"
}
