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
  count    = length(data.digitalocean_regions.available-with-features.regions)
  image    = var.image
  name     = "droplet-${var.customer-name}-${var.project-name}-${count.index}-${var.deployed-by}"
  region   = var.regions[count.index]
  size     = var.droplet_size
  vpc_uuid = digitalocean_vpc.acme_vpc.id
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]
}

#Creating the SSH resource for the droplet
resource "digitalocean_ssh_key" "default" {
  name       = "ssh-key-${var.customer-name}-${var.project-name}"
  public_key = file("/home/miguel/.ssh/github_key.pub")
}