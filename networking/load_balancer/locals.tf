locals {
  dynamic-regions = [for region_attribute in data.digitalocean_regions.available-with-features.regions : region_attribute.slug]
  droplets-ids    = [for droplet-id in data.digitalocean_droplets.droplet-id.droplets : droplet-id.id]
}