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
go to github profile settings>developer settings>personal access tokens>tokens (classic)> generate new token(classic)
copy the token and store the copied text somewhere safe
add the token in manage jenkins>Credentials>System>Global credentials (unrestricted) and save it
create a  pipeline in jenkins, name it, check GitHub hook trigger for GITScm polling option, select GitHub hook trigger for GITScm polling, use */main as branch and script path should be Jenkinsfile
save the pipeline
create a webhook to trigger automatic running of pipeline in github: go to repo settings> webhooks> add webhooks> iuse payload url : <jenkins url>github-webhook/; content type: application json; disable SSL verification as we are not using it.
select add webhook
make sure that you see a green tick after adding the webhook.
commit something in repo, it should create a bucket.

Checks: 
restart jenkins if needed from ssh into the instance using systemctl stop/start/status jenkins
I faced the error: Couldn't find any revision to build. Verify the repository and branch configuration for this job
Solution: 
earlier: git: "https://<token>@github.com/username/repoName.git"
instead,
stage ('Git Checkout') {
  steps {
      git branch: 'main', url: 'https://<token>@github.com/username/repoName.git'
     }
  }
source: https://stackoverflow.com/questions/23906352/git-pullrequest-job-failed-couldnt-find-any-revision-to-build-verify-the-repo

