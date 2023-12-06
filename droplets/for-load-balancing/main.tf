#Using dynamic list with specific features for the regions

resource "digitalocean_droplet" "mz-multiple-droplet-single-region" {
  count         = 2
  user_data     = file("scripts/userdata.yml")
  image         = var.image
  name          = "droplet-${var.customer-name}-${var.project-name}-${count.index}-${var.deployed-by}"
  size          = var.droplet_size
  ssh_keys      = [digitalocean_ssh_key.default.fingerprint]
  droplet_agent = true
  tags          = local.tags #This attribute expect a list of string
  region        = local.dynamic-regions[0]
  vpc_uuid      = local.vpc-uuid-list[0]
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