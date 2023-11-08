resource "digitalocean_vpc" "acme_vpc" {
  name     = "vpc-${var.customer-name}-${var.project-name}"
  region   = var.region
  ip_range = var.vpc-cidr
}