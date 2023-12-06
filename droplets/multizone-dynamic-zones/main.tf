#Without using any variable 
resource "digitalocean_droplet" "web-app" {
  image  = "ubuntu-20-04-x64"
  name   = "webserver"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
}

#Using variables 
resource "digitalocean_droplet" "web-app-exportable" {
  image  = var.image
  name   = var.name
  region = var.region
  size   = var.droplet_size
}

#Using fixed list of regions too deploy the droplets

resource "digitalocean_droplet" "mz-deploy-static-list" {
  count         = length(var.regions)
  user_data     = file("userdata.yml")
  image         = var.image
  name          = "droplet-${var.customer-name}-${var.project-name}-${count.index}-${var.deployed-by}"
  region        = var.regions[count.index]
  size          = var.droplet_size
  ssh_keys      = [digitalocean_ssh_key.default.fingerprint]
  droplet_agent = true
  tags          = local.tags
}

# #Using dynamic list with specific features for the regions

resource "digitalocean_droplet" "mz-deploy-dynamic" {
  for_each      = local.mz-map
  user_data     = file("userdata.yml")
  image         = var.image
  name          = "droplet-${var.customer-name}-${var.project-name}-${each.key}-${var.deployed-by}"
  size          = var.droplet_size
  ssh_keys      = [digitalocean_ssh_key.default.fingerprint]
  droplet_agent = true
  tags          = local.tags #This attribute expect a list of string
  region        = each.key
  vpc_uuid      = each.value
}


#Creating the SSH resource for the droplet
resource "digitalocean_ssh_key" "default" {
  name       = "ssh-key-${var.customer-name}-${var.project-name}"
  public_key = file("/home/miguel/.ssh/github_key.pub")
}

#Tags for the droplet
resource "digitalocean_tag" "tags-for-project" {
  for_each = toset(var.tags)
  name = each.key
}