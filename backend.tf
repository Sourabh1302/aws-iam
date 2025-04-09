terraform {
  backend "s3" {
    bucket = "terraform-state-250225"
    key    = "okta_iam/state.tfstate"
    region = "ap-south-1"

  }
}