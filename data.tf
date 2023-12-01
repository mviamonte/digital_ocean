#For future uses, I should find a way to use this as a source for the regions to be deployed
#Also I should use this for the argument of the meta argument count   = length(data.digitalocean_regions.available-with-features.regions)
data "digitalocean_regions" "available-with-features" {
  filter {
    key    = "available"
    values = ["true"]
  }
  filter {
    key    = "features"
    values = ["backups"]
  }
  filter {
    key      = "sizes"
    values   = ["s-1vcpu"]
    match_by = "substring"
  }
  filter {
    key      = "slug"
    values   = ["ny"]
    match_by = "substring"
  }
}

data "digitalocean_vpc" "ny-region-vpcs" {
  count = length(local.dynamic-regions)
  region = local.dynamic-regions[count.index]
}