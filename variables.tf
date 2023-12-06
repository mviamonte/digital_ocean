#Variable for Digital Ocean API Token
variable "do_token" {}

variable "image" {
  default     = "ubuntu-20-04-x64"
  description = "String for Ubuntu 20.04"
}

variable "name" {
  default     = "webserver"
  description = "value for web server"
}

variable "region" {
  default     = "nyc1"
  description = "NYC Region"
}

variable "regions" {
  type        = list(any)
  default     = ["nyc1", "nyc3"]
  description = "Fixed list for regions"
}

variable "droplet_size" {
  default     = "s-1vcpu-1gb"
  description = "size of the server"
}

variable "customer-name" {
  default     = "ACME"
  description = "Name of the customer"
}

variable "project-name" {
  default     = "web-app"
  description = "Name of the application"
}

variable "vpc-cidr" {
  default     = "10.108.16.0/20"
  description = "CIDR for the VPC"
}

variable "deployed-by" {
  default = "mv"
  type    = string
}

#Hardcoding names for VPC because I don't have yet remote state

variable "vpc-ids" {
  type    = list(any)
  default = ["vpc-ACME-mv-nyc1", "vpc-ACME-mv-nyc3"]
}