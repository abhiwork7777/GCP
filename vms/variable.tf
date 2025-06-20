variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region to deploy resources"
  type        = string
}

variable "zone" {
  description = "The GCP zone to deploy the VM"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the VM"
  type        = string
}

variable "vm_name" {
  description = "The name of the VM"
  type        = string
}

variable "service_account_email" {
  description = "The service account email"
  type        = string
}
