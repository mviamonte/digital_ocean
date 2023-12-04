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

# resource "digitalocean_droplet" "mz-deploy-static" {
#   count         = length(var.regions)
#   user_data     = file("userdata.yml")
#   image         = var.image
#   name          = "droplet-${var.customer-name}-${var.project-name}-${count.index}-${var.deployed-by}"
#   region        = var.regions[count.index]
#   size          = var.droplet_size
#   vpc_uuid      = data.digitalocean_vpc.acme-vpc-single-region.id
#   ssh_keys      = [digitalocean_ssh_key.default.fingerprint]
#   droplet_agent = true
#   tags          = [digitalocean_tag.company.id, digitalocean_tag.webserver.id, digitalocean_tag.poc.id]
# }

# #Using dynamic list with specific features for the regions

# resource "digitalocean_droplet" "mz-deploy-dynamic" {
#   user_data     = file("userdata.yml")
#   image         = var.image
#   name          = "droplet-${var.customer-name}-${var.project-name}-${var.deployed-by}"
#   size          = var.droplet_size
#   ssh_keys      = [digitalocean_ssh_key.default.fingerprint]
#   droplet_agent = true
#   tags          = [digitalocean_tag.company.id, digitalocean_tag.webserver.id, digitalocean_tag.poc.id]
#   dynamic "region" {
#       for_each = local.mz_map
#       content {
#         region = region.value
#         vpc_uuid = region.value
#       }
#     }
# }

resource "digitalocean_droplet" "mz-deploy-dynamic" {
  image = var.image
  name  = "droplet-${var.customer-name}-${var.project-name}-${var.deployed-by}"
  size  = var.droplet_size
  dynamic "region" {
    for_each = local.mz_map
    content {
      region        = region.value
      vpc_uuid      = region.value
      user_data     = file("userdata.yml")
      ssh_keys      = [digitalocean_ssh_key.default.fingerprint]
      droplet_agent = true
      tags          = [digitalocean_tag.company.id, digitalocean_tag.webserver.id, digitalocean_tag.poc.id]
    }
  }
}



#Creating the SSH resource for the droplet
resource "digitalocean_ssh_key" "default" {
  name       = "ssh-key-${var.customer-name}-${var.project-name}"
  public_key = file("/home/miguel/.ssh/github_key.pub")
}

#Tags for the droplet
resource "digitalocean_tag" "poc" {
  name = "POC"
}

resource "digitalocean_tag" "webserver" {
  name = "webserver"
}

resource "digitalocean_tag" "company" {
  name = "ACME"
}