output "dynamic-regions" {
  value = local.dynamic-regions
}

output "droplet-ids" {
  value = data.digitalocean_droplets.droplet-id
}

output "lb-ip" {
  value = digitalocean_loadbalancer.apache-lb.ip
}

output "lb-size" {
  value = digitalocean_loadbalancer.apache-lb.size
}
