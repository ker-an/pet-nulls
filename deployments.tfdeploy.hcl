deployment "single" {
  variables = {
    prefix = "shingle"
    instances = 1
  }
}

deployment "many" {
  variables = {
    prefix = "many"
    instances = 5
  }
}
