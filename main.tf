resource "digitalocean_droplet" "web-app" {
  image  = "ubuntu-20-04-x64"
  name   = "webserver"
  region = "nyc2"
  size   = "s-1vcpu-1gb"
}
