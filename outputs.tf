output "dynamic-regions" {
  value = local.dynamic-regions
}

output "mz-map" {
  value = local.mz-map
}
#This output is only for demostrating for expression purposes
output "map-multi-deploy" {
  value = local.mz-multi-deploy
}

#All the regions and features from data source
output "all_regions_and_features" {
  value = data.digitalocean_regions.available-with-features.regions
}

output "ny-regions-vpc" {
  value = data.digitalocean_vpc.ny-region-vpcs
}

output "vpc-uuid-list" {
  value = local.vpc-uuid-list
}