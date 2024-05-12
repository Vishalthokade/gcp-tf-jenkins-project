# GCP Terraform Jenkins Project

This project sets up a Continuous Integration/Continuous Deployment (CI/CD) pipeline using Jenkins and Terraform to manage resources on Google Cloud Platform (GCP).

## Jenkins Pipeline Configuration

The `Jenkinsfile` in this repository defines the CI/CD pipeline with the following stages:

1. **Git Checkout:** Retrieves the latest code from the GitHub repository.
2. **Terraform Init:** Initializes Terraform in the Jenkins environment.
3. **Terraform Plan:** Generates an execution plan for Terraform.
4. **Manual Approval:** Waits for manual approval before proceeding.
5. **Terraform Apply:** Applies the Terraform execution plan to provision resources on GCP.

## Terraform Configuration

The `main.tf` file contains the Terraform configuration to create a Google Cloud Storage (GCS) bucket with the following properties:

## Additional Notes

- A Git token and GCP service account key (`gcp-key`) are required for authentication.
- Ensure proper access control and permissions are configured for Jenkins and GCP resources.
CI/CD Pipeline using Jenkins and Terraform | GitHub Webhook Trigger

## Prerequisites:

A cloud provider account (e.g., Google Cloud Platform) with a deployable Jenkins instance
Access to a GitHub repository
Steps:

## CI/CD Pipeline using Jenkins and Terraform | Github Webhook Trigger

**1.** Deploy a Jenkins instance from marketplace.

**2.** Go to Deployment Manager to view its configuration.

**3.** Open the Jenkins page.

**4.** Download plugins from **Manage Jenkins** tab such as Groovy, Pipeline, Credentials.

**5.** Restart Jenkins once all plugins are downloaded.

**6.** SSH into the Jenkins VM instance.

**7.** Run `sudo apt-get update` and install Terraform using below command:
```bash
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install terraform
```

**8.** Confirm using `terraform version` command.

**9.** Create the current Git repo.

**10.** Add files `Jenkinsfile`, `main.tf`, `README.md`.

**11.** Create Service Account (SA) to authorize Git with Jenkins application.

**12.** Give it the permission of Storage Admin to keep things simple for learning.

**13.** Create its JSON key and download it.

**14.** Add the JSON key file in **Manage Jenkins > Credentials > System > Global credentials (unrestricted)** and save it. This will be `GOOGLE_APPLICATION_CREDENTIALS`.

**15.** Go to GitHub profile settings > Developer settings > Personal access tokens > Tokens (classic) > Generate new token (classic).

**16.** Copy the token and store the copied text somewhere safe.

**17.** Add the token in **Manage Jenkins > Credentials > System > Global credentials (unrestricted)** and save it.

**18.** Create a pipeline in Jenkins, name it, check **GitHub hook trigger for GITScm polling** option, select **GitHub hook trigger for GITScm polling**, use `*/main` as branch, and script path should be `Jenkinsfile`.

**19.** Save the pipeline.

**20.** Create a webhook to trigger automatic running of pipeline in GitHub: go to repo settings > Webhooks > Add webhook > Use payload URL: `<Jenkins URL>github-webhook/`; content type: `application/json`; disable SSL verification as we are not using it.

**21.** Select **Add webhook**.

**22.** Make sure that you see a green tick after adding the webhook.

### Checks:

- Restart Jenkins if needed from SSH into the instance using `systemctl stop/start/status jenkins`.
- If faced the error: "Couldn't find any revision to build. Verify the repository and branch configuration for this job", Solution:
  - Earlier: `git: "https://<token>@github.com/username/repoName.git"`
  - Instead,
    ```groovy
    stage ('Git Checkout') {
        steps {
            git branch: 'main', url: 'https://<token>@github.com/username/repoName.git'
        }
    }
    ```
  Source: [Stack Overflow](https://stackoverflow.com/questions/23906352/git-pullrequest-job-failed-couldnt-find-any-revision-to-build-verify-the-repo)
