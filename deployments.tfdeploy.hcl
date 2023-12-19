deployment "single" {
  variables = {
    prefix = "simple"
    instances = 5
  }
}

deployment "many" {
  variables = {
    prefix = "many"
    instances = 20
  }
}
