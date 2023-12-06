#Variable for Digital Ocean API Token
variable "do_token" {}

variable "image" {
  default     = "ubuntu-20-04-x64"
  description = "String for Ubuntu 20.04"
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

variable "deployed-by" {
  default = "mv"
  type    = string
}

variable "tags" {
  type = list(any)
  default = ["POC","webserver","ACME"]
  
}