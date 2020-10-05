provider "google" {
  version = "3.7"
  credentials = file("~/.config/gcloud/keys/dp-ops.json")
  project = var.project
  region = var.region
  zone = var.zone
}

resource "google_cloudfunctions_function_iam_member" "invoker" {
  project = var.project
  region = var.region
  cloud_function = "hello-world"

  role = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
