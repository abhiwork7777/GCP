# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# Resource: VPC Network
resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false  # Custom mode VPC (manual subnets)
  description             = "Custom VPC network created via Terraform"
}

# Resource: Subnet within the VPC
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
  description   = "Subnet for ${var.vpc_name} in ${var.region}"
}

# 🔹 Resource: Firewall Rule (Security Group Equivalent)
resource "google_compute_firewall" "allow_http_https" {
  name    = "allow-networking"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22", "8080", "9000"]
  }

  source_ranges = ["0.0.0.0/0"]  # Allow traffic from any IP
  target_tags   = ["web-server"] # Attach this rule to instances with this tag
  description   = "Allow HTTP, HTTPS, SSH, and custom ports"
}

# 🔹 Resource: Firewall Rule (Deny All Traffic - Default Security)
resource "google_compute_firewall" "deny_all" {
  name    = "deny-all"
  network = google_compute_network.vpc_network.name

  deny {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
  description   = "Deny all other traffic for security"
}

