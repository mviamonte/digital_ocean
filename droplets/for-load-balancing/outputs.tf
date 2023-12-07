output "dynamic-regions" {
  value = local.dynamic-regions
}

output "mz-map" {
  value = local.mz-map
}

output "vpc-uuid-list" {
  value = local.vpc-uuid-list
}

output "tags" {
  value = keys(digitalocean_tag.tags-for-project)
}

output "droplet-ipv4" {
  value = digitalocean_droplet.mz-multiple-droplet-single-region[0].ipv4_address
}

output "droplet-disk" {
  value = digitalocean_droplet.mz-multiple-droplet-single-region[0].disk
}

output "droplet-volume-ids" {
  value = digitalocean_droplet.mz-multiple-droplet-single-region[0].volume_ids
}
