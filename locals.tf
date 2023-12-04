locals {
  dynamic-regions = [for region_attribute in data.digitalocean_regions.available-with-features.regions : region_attribute.slug]
  vpc_uuid_list   = [for uuid in data.digitalocean_vpc.ny-region-vpcs : uuid.id]
  mz_map          = zipmap(local.dynamic-regions, local.vpc_uuid_list)
}