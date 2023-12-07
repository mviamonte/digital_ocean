#Using dynamic list with specific features for the regions
resource "digitalocean_loadbalancer" "apache-lb" {
  name     = "lb-${var.customer-name}-${var.project-name}-${var.deployed-by}"
  region   = local.dynamic-regions[0]
  vpc_uuid = local.vpc-uuid-list[0]
  size     = var.lb-size
  #Using map access interpolation or functions
  forwarding_rule {
    entry_port     = var.lb-ports.forwarding-rule["http"]
    entry_protocol = keys(var.lb-ports.forwarding-rule)[0]

    target_port     = var.lb-ports.forwarding-rule["http"]
    target_protocol = keys(var.lb-ports.forwarding-rule)[0]
  }
  #For the case of the protocol, keys returns a list with only one element
  healthcheck {
    port                     = var.lb-ports.healthcheck["tcp"]
    protocol                 = keys(var.lb-ports.healthcheck)[0]
    check_interval_seconds   = var.healthcheck-config["check_interval"]
    healthy_threshold        = var.healthcheck-config["healthy_th"]
    response_timeout_seconds = var.healthcheck-config["timeout"]
    unhealthy_threshold      = var.healthcheck-config["unhealthy_th"]
  }

  droplet_ids = local.droplets-ids
}