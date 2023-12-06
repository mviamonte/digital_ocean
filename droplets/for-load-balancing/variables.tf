#Variable for Digital Ocean API Token
variable "do_token" {}

variable "image" {
  default     = "ubuntu-20-04-x64"
  description = "String for Ubuntu 20.04"
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

#Hardcoding names for VPC because I don't have yet remote state

variable "vpc-ids" {
  type    = list(any)
  default = ["vpc-ACME-mv-nyc1", "vpc-ACME-mv-nyc3"]
}

variable "tags" {
  type    = list(any)
  default = ["POC", "webserver", "ACME"]

}