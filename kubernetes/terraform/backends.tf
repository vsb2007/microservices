# Work if creadentals are given by env varible.
# E.G. export GOOGLE_CREDENTIALS=$(cat account.json)
#
terraform {
  backend "gcs" {
    bucket  = "vsb2007_terraform"
    path    = "kge/terraform.tfstate"
    project = "infra-179306"
  }
}
