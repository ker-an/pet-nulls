deployment "single" {
  variables = {
    prefix = "single"
    instances = 1
  }
}

deployment "many" {
  variables = {
    prefix = "several"
    instances = 5
  }
}
