deployment "single" {
  variables = {
    prefix    = "one"
    instances = 1
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
    condition = context.plan.component_changes["pet"].total == 0
    error_message = "Changes proposed to pet component."
  }
}
