#Variable for Digital Ocean API Token
variable "do_token" {}

variable "region" {
  default     = "nyc1"
  description = "NYC Region"
}

variable "regions" {
  type        = list(any)
  default     = ["nyc1", "nyc2", "nyc3"]
  description = "Fixed list for regions"
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