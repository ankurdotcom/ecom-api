provider "google" {
  credentials = file("path-to-service-account-key.json")
  project     = var.project_id
  region      = var.region
}

module "cloud_sql" {
  source = "./modules/cloud-sql"
  instance_name = "ecom-db"
  database_name = "ecommerce"
  user          = "admin"
  password      = "admin123"
}

module "redis" {
  source = "./modules/redis"
  instance_name = "ecom-redis"
}

module "pubsub" {
  source = "./modules/pubsub"
  topics = ["inventory-events", "payment-events"]
}
