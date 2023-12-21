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

deployment "huge" {
  variables = {
    prefix = "huge"
    instances = 50
  }
}
