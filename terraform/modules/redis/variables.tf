variable "instance_name" {
  description = "Name of the Redis instance"
  type        = string
}

variable "region" {
  description = "Region for the Redis instance"
  type        = string
  default     = "us-central1"
}

variable "memory_size_gb" {
  description = "Memory size for the Redis instance in GB"
  type        = number
  default     = 1
}

variable "tier" {
  description = "Tier for the Redis instance (BASIC or STANDARD_HA)"
  type        = string
  default     = "BASIC"
}
