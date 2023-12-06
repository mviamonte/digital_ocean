#To validate the values of the output, check the output format after the terraform plan
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

# data "digitalocean_vpc" "ny-region-vpcs" {
#   for_each = toset(var.vpc-ids)
#   name     = each.key
# }