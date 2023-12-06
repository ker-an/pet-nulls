deployment "single" {
  variables = {
    prefix    = "one"
    instances = 1
  }
}

deployment "many" {
  variables = {
    prefix    = "many"
    instances = 10
  }
}
