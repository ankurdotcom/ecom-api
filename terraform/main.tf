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
  credentials = "keys.json"
}

# Redis Module
module "redis" {
  source        = "./modules/redis"
  instance_name = "ecom-redis"
  region        = "us-central1"
  memory_size_gb = 2
  tier          = "BASIC"
}

output "redis_instance" {
  value = module.redis.redis_instance_name
}
