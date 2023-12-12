terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

variable "pet" {
  type = string
}

variable "instances" {
  type = number
}

resource "null_resource" "this" {
  count = var.instances

  triggers = {
    pet = var.pet
  }
}

resource "null_resource" "secret" {
  triggers = {
    pet = sensitive(var.pet)
  }
}

output "ids" {
  value = [for n in null_resource.this : n.id]
}
