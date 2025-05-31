# Project ID for GCP
variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
  default     = "my-default-project"  # Default value; override with your project ID
}

# Region for the VPC and subnet
variable "region" {
  description = "The region for the VPC and subnet"
  type        = string
  default     = "us-central1"  # Default region
}

# VPC name
variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
  default     = "default-vpc"  # Default VPC name
}

# Subnet name
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "default-subnet"  # Default subnet name
}

# Subnet CIDR range
variable "subnet_cidr" {
  description = "The CIDR range for the subnet"
  type        = string
  default     = "10.0.0.0/16"  # Default CIDR range
}