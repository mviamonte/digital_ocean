#Using dynamic list with specific features for the regions
resource "digitalocean_loadbalancer" "apache-lb" {
  name     = "lb-${var.customer-name}-${var.project-name}-${var.deployed-by}"
  region   = local.dynamic-regions[0]
  vpc_uuid = local.vpc-uuid-list[0]

  forwarding_rule {
    entry_port     = var.lb-ports.forwarding-rule["http"]
    entry_protocol = "http"

    target_port     = var.lb-ports.forwarding-rule["http"]
    target_protocol = "http"
  }

  healthcheck {
    port     = var.lb-ports.healthcheck["tcp"]
    protocol = "tcp"
  }

  droplet_ids = local.droplets-ids
}