#Using fixed list of regions too deploy the droplets

resource "digitalocean_droplet" "mz-deploy-static-list" {
  count         = length(var.regions)
  user_data     = file("scripts/userdata.yml")
  image         = var.image
  name          = "droplet-${var.customer-name}-${var.project-name}-${count.index}-${var.deployed-by}"
  region        = var.regions[count.index]
  size          = var.droplet_size
  ssh_keys      = [digitalocean_ssh_key.default.fingerprint]
  droplet_agent = true
  tags          = local.tags
}

#Creating the SSH resource for the droplet
resource "digitalocean_ssh_key" "default" {
  name       = "ssh-key-${var.customer-name}-${var.project-name}"
  public_key = file("/home/miguel/.ssh/github_key.pub")
}

#Tags for the droplet
resource "digitalocean_tag" "tags-for-project" {
  for_each = toset(var.tags)
  name     = each.key
}