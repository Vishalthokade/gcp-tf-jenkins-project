resource "google_storage_bucket" "my_gcs_bucket1"{
name ="gcp-tf-jenkins-bucket"
project = "My First Project"
location = "US"
force_destroy= true
public_access_prevention = "enforced"
}
