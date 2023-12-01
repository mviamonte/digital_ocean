resource "digitalocean_vpc" "acme-vpc-nyc-region" {
  count = length(var.regions)
  name     = "vpc-${var.customer-name}-${var.deployed-by}-${var.regions[count.index]}"
  region   = var.regions[count.index]
  ip_range = local.ip_nets[count.index]
}