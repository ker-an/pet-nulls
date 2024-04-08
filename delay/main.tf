locals {
  three  = terraform_data.three.input.pause
  six    = terraform_data.six.input.pause
  twelve = terraform_data.twelve.input.pause
}

data "http" "three" {
  url = "https://httpbin.org/delay/3?pause=3"
}

resource "terraform_data" "three" {
  input = {
    pause = jsondecode(data.http.three.response_body).args.pause
  }
}

data "http" "six" {
  url = "https://httpbin.org/delay/${local.three * 2}?pause=${local.three * 2}"
}

resource "terraform_data" "six" {
  input = {
    pause = jsondecode(data.http.six.response_body).args.pause
  }
}

data "http" "twelve" {
  url = "https://httpbin.org/delay/${local.six * 2}?pause=${local.six * 2}"
}

resource "terraform_data" "twelve" {
  input = {
    pause = jsondecode(data.http.twelve.response_body).args.pause
  }
}

data "http" "one_twenty" {
  url = "https://httpbin.org/delay/${local.twelve * 10}?pause=${local.six * 10}"
}

resource "terraform_data" "one_twenty" {
  input = {
    pause = jsondecode(data.http.one_twenty.response_body).args.pause
  }
}

output "result" {
  value = terraform_data.one_twenty.input.pause
}
