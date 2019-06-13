workflow "Build" {
  on = "push"
  resolves = ["Run Isopod"]
}

action "Run Isopod" {
  uses = "./actions/isopod"
  secrets = ["SSH_PRIVATE_KEY"]
  args = "env"
  env = {
    GIT_REPO_URL = "git@github.com:ricardo-ch/delivery-demo.git"
    DEMO = "AnyValue"
  }
}


#action "Authenticate Google Cloud" {
#  uses = "actions/gcloud/auth@ba93088eb19c4a04638102a838312bb32de0b052"
#  secrets = ["GCLOUD_AUTH"]
#}

#action "Build Image with Google Cloud Build" {
#  uses = "actions/gcloud/cli@ba93088eb19c4a04638102a838312bb32de0b052"
#  needs = ["Authenticate Google Cloud"]
#  args = "builds submit --project ricardo-dev-ch"
#}
