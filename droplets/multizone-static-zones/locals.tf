locals {
  dynamic-regions = [for region_attribute in data.digitalocean_regions.available-with-features.regions : region_attribute.slug]
  tags = keys(digitalocean_tag.tags-for-project)
}