data "digitalocean_droplets" "droplet-id" {
  filter {
    key    = "tags"
    values = ["webserver"]
  }
}

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