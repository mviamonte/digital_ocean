output "dynamic-regions" {
  value = local.dynamic-regions
}

output "droplet-ids" {
  value = data.digitalocean_droplets.droplet-id
}