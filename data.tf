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
    key = "sizes"
    values = ["s-1vcpu"]
    match_by = "substring"
  }
}

#Testing the data singular data resource
data "digitalocean_region" "sfo2" {
  slug = "sfo2"
}

output "region_name" {
  value = data.digitalocean_region.sfo2.name
}

output "region_status" {
  value = data.digitalocean_region.sfo2.available
}

output "region_sizes" {
  value = data.digitalocean_region.sfo2.sizes
}

output "region_features" {
  value = data.digitalocean_region.sfo2.features
}