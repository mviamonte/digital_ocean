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

variable "droplet_size" {
  default     = "s-1vcpu-1gb"
  description = "size of the server"
}