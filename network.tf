resource "digitalocean_vpc" "acme-vpc-single-region" {
  name     = "vpc-${var.customer-name}-${var.project-name}-${var.deployed-by}"
  region   = var.region
  ip_range = var.vpc-cidr
}

# resource "digitalocean_vpc" "acme-vpc-dynamic-multi-region" {
#   count  = length(local.dynamic-regions)
#   name   = "vpc-${var.customer-name}-${var.project-name}-${count.index}-${var.deployed-by}"
#   region = local.dynamic-regions[count.index]
# }