required_providers {
  null = {
    source  = "hashicorp/null"
    version = "~> 3.1"
  }

  random = {
    source  = "hashicorp/random"
    version = "~> 3.3"
  }
}

variable "prefix" {
  type = string
}

variable "instances" {
  type = number
}

provider "http" "main" {}
provider "terraform" "main" {}
provider "null" "main" {}
provider "random" "main" {}

component "delay" {
  source = "./delay"
  providers = {
    http      = provider.http.main
    terraform = provider.terraform.main
  }
}

component "pet" {
  source = "./pet"
  inputs = {
    prefix = "var.prefix-${component.delay.result}"
  }
  providers = {
    random = provider.random.main
  }
}

component "nulls" {
  source = "./nulls"
  inputs = {
    pet       = component.pet.name
    instances = var.instances
  }
  providers = {
    null = provider.null.main
  }
}
