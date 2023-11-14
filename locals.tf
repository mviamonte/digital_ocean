locals {
  dynamic-regions = [for region_attribute in data.digitalocean_regions.available-with-features.regions : region_attribute.slug]
  ip_nets         = cidrsubnets(var.vpc-cidr, 4, 4)
}