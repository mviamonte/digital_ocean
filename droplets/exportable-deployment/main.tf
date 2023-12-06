#Using variables 
resource "digitalocean_droplet" "web-app-exportable" {
  image  = var.image
  name   = var.name
  region = var.region
  size   = var.droplet_size
}