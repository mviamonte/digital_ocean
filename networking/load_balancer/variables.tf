#Variable for Digital Ocean API Token
variable "do_token" {}

variable "lb-size" {
  type    = string
  default = "lb-medium"
}

variable "lb-ports" {
  type = map(any)
  default = {
    forwarding-rule = {
      http = 80
    },
    healthcheck = {
      tcp = 22
    }
  }
}

variable "healthcheck-config" {
  type = map(number)
  default = {
    check_interval = 10
    unhealthy_th   = 10
    healthy_th     = 10
    timeout        = 10
  }

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