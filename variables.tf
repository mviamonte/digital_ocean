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
  default     = "nyc2"
  description = "NYC Region"
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
  default     = "10.10.10.0/24"
  description = "CIDR for the VPC"
}