locals {
  dynamic-regions = [for region_attribute in data.digitalocean_regions.available-with-features.regions : region_attribute.slug]
  vpc-uuid-list   = [for uuid in data.digitalocean_vpc.ny-region-vpcs : uuid.id]
  mz-map          = zipmap(local.dynamic-regions, local.vpc-uuid-list)
  mz-multi-deploy = {
    for az, vpc in local.mz-map : az => [
      for vpc_id in local.vpc-uuid-list : vpc_id
    ]
  }
  tags = keys(digitalocean_tag.tags-for-project)
}