deployment "single" {
  variables = {
    prefix = "single-redo"
    instances = 1
  }
}

deployment "many" {
  variables = {
    prefix = "many"
    instances = 5
  }
}
