locals {
  ip_nets         = cidrsubnets(var.vpc-cidr, 4, 4, 4)
}