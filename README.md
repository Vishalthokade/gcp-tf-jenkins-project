# gcp-tf-jenkins-project
CI/CD Pipeline using Jenkins and Terraform | Github Webhook Trigger
deploy a jenkins instance from marketplace
go to deployment manager to view its configuration
open the jenkins page
download plugins from manage jenkins tab such as groovy, pipeline, credentials
restart jenkins once all plugins are downloaded
ssh into the jenkins vm instance
run sudo apg-get update and install terraform using below command 
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
confirm using terraform version command
create the current git repo
add files jenkinsfile, main.tf, readme.md
create sa to authorise git with jenkins application
give it the permission of storage admin to keep things simple for learning 
create its json key and download it
add the json key file in manage jenkins>Credentials>System>Global credentials (unrestricted) and save it
this will be GOOGLE_APPLICATION_CREDENTIALS

