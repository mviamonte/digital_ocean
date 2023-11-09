resource "digitalocean_vpc" "acme_vpc" {
  name     = "vpc-${var.customer-name}-${var.project-name}-${var.deployed-by}"
  region   = var.region
  ip_range = var.vpc-cidr
}