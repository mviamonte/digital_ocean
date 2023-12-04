output "testdynamic-regions" {
  value = local.dynamic-regions
}

output "new_map" {
  value = local.mz_map
}

# All the regions and features from data source
# output "all_regions_and_features" {
#   value = data.digitalocean_regions.available-with-features.regions
# }

# #Testing the data singular data resource
# data "digitalocean_region" "sfo2" {
#   slug = "sfo2"
# }

# output "region_name" {
#   value = data.digitalocean_region.sfo2.name
# }

# output "region_status" {
#   value = data.digitalocean_region.sfo2.available
# }

# output "region_sizes" {
#   value = data.digitalocean_region.sfo2.sizes
# }

# output "region_features" {
#   value = data.digitalocean_region.sfo2.features
# }