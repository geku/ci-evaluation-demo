workflow "Build" {
  on = "push"
  resolves = ["Execute Google Cloud Build"]
}

action "Setup Google Cloud" {
  uses = "actions/gcloud/auth@ba93088eb19c4a04638102a838312bb32de0b052"
  secrets = ["GCLOUD_AUTH"]
}

action "Execute Google Cloud Build" {
  uses = "actions/gcloud/cli@ba93088eb19c4a04638102a838312bb32de0b052"
  needs = ["Setup Google Cloud"]
  args = "builds submit --project ricardo-dev-ch"
}
