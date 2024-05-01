resource "google_storage_bucket" "my_gcs_bucket1"{
name                     ="gcp-tf-jenkins-bucket"
project                  = "central-rampart-421909-r3"
location                 = "US"
force_destroy            = true
public_access_prevention = "enforced"
}

resource "google_storage_bucket" "my_gcs_bucket2"{
name                     ="gcp-tf-jenkins-bucket2-renaming-bucket"
project                  = "central-rampart-421909-r3"
location                 = "US"
force_destroy            = true
public_access_prevention = "enforced"
}
##comment added to check if end to end cicd is implemented or not
