#Without using any variable 
resource "digitalocean_droplet" "web-app" {
  image  = "ubuntu-20-04-x64"
  name   = "webserver"
  region = "nyc2"
  size   = "s-1vcpu-1gb"
}

#Using variables 
resource "digitalocean_droplet" "web-app-exportable" {
  image  = var.image
  name   = var.name
  region = var.region
  size   = var.droplet_size
}

#Using data resources with different filters

resource "digitalocean_droplet" "web-app-smart" {
  for_each = data.digitalocean_regions.available-with-features.region.slug
  image    = var.image
  name     = var.name
  region   = each.value
  size     = var.droplet_size
  vpc_uuid = digitalocean_vpc.acme_vpc.id
}
