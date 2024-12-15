terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.13.0"
    }
  }
}

provider "google" {
  project = "ecom-api-github-ankurdotcom"
  region  = "us-central1"
  zone = "us-central1-a"
}

# Pub/Sub Module
module "pubsub" {
  source = "./modules/pubsub"

  topics = ["inventory-events", "payment-events", "order-updates"]

  subscriptions = [
    {
      topic_name           = "inventory-events"
      subscription_name    = "inventory-sub"
      ack_deadline_seconds = 20
    },
    {
      topic_name           = "payment-events"
      subscription_name    = "payment-sub"
      ack_deadline_seconds = 10
    }
  ]
}

# Redis Module
module "redis" {
  source        = "./modules/redis"
  instance_name = "ecom-redis"
  region        = "us-central1"
  memory_size_gb = 2
  tier          = "BASIC"
}

# Cloud SQL Module
module "cloud_sql" {
  source        = "./modules/cloud_sql"
  instance_name = "ecom-db"
  database_name = "ecommerce"
  user          = "admin"
  password      = "admin123"
  region        = "us-central1"
}

output "pubsub_topics" {
  value = module.pubsub.topic_names
}

output "pubsub_subscriptions" {
  value = module.pubsub.subscription_names
}

output "redis_instance" {
  value = module.redis.redis_instance_name
}

output "cloud_sql_connection" {
  value = module.cloud_sql.cloud_sql_connection_name
}
