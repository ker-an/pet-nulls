deployment "single" {
  variables = {
    prefix    = "single"
    instances = 1
  }
}

deployment "two" {
  variables = {
    prefix    = "two"
    instances = 2
  }
}

deployment "many" {
  variables = {
    prefix    = "many"
    instances = 15
  }
}

orchestrate "auto_approve" "no_pet_changes" {
  check {
    condition = context.plan.component_changes["component.pet"].total == 0
    error_message = "Changes proposed to pet component."
  }
}
