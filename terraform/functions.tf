# GCF Function Definitions

resource "google_cloudfunctions_function" "hello-world" {
  name = "hello-world"
  description = "Hello World cloud function example"
  runtime = "nodejs10"

  available_memory_mb = 128
  trigger_http = true
  timeout = 540
  entry_point = "helloGET"

  source_repository {
    url = "https://source.developers.google.com/projects/${var.project}/repos/${var.repo}/moveable-aliases/${var.branch}/paths/src/hello_world"
  }
}
