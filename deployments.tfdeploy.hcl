deployment "single" {
  variables = {
    prefix = "single"
    instances = 5
  }
}

deployment "many" {
  variables = {
    prefix = "many"
    instances = 20
  }
}
