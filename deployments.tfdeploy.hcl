deployment "single" {
  variables = {
    prefix = "simple"
    instances = 1
  }
}

deployment "many" {
  variables = {
    prefix = "many"
    instances = 10
  }
}
