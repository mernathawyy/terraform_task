variable "vpc_id" {
  type = string
}

variable "public_subnet" {
  type = object({
    cidr = string
    az   = string
  })
}

variable "private_subnets" {
  type = list(object({
    cidr = string
    az   = string
  }))
}


