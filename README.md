# How to set up automated docker-compose deploy with GitHub Actions - edit

[![Deployed to Development EC2 Instance](https://github.com/JordonWest/wine-api/actions/workflows/deploy.yml/badge.svg)](https://github.com/JordonWest/wine-api/actions/workflows/deploy.yml)

## Prerequisites

1. One or more EC2 Instances set up on on AWS.
2. EC2 Instances provisioned as so:
    ```bash
    sudo yum install -y git && \
    sudo yum install libicu -y && \
    sudo yum install docker -y && \
    sudo service docker start && \
    sudo usermod -aG docker $USER  && \
    sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && \
    sudo chmod +x /usr/local/bin/docker-compose && \
    newgrp docker
3. ssh keys downloaded for each EC2 instance

## Create Actions Secrets and Variables

1. Go the the [Settings page] for your repository.
2. Using the Navbar on the left, under the section called "Security", open the dropdown named "Secrets and Variables" and select "Actions" to navigate to the [Actions Secrets and Variables page].
3. Click the "New repository secret" button.
4. Name the secret "EC2_SSH_KEY" and paste the contents of your `ssh` key from AWS.
    1. You can name this whatever you'd like. Conventionally, secrets/variables should be in Screaming Snake-case. (LIKE_THIS)
5. Tab over to the [Variables page] and click the "New repository variable" button.
6. Name the secret "DEV_INSTANCE" and paste the Public IPv4 DNS. (Mine is ec2-3-17-9-84.us-east-2.compute.amazonaws.com)
    1. **Note:** this is an optional step - you could just add this in plaintext to the Action later, but this is cleaner.

## Create Workflow

1. Go to the [Actions page] for your repository.
2. Click the "New workflow" button on the left side.
3. Under the "Automation" section, find the "Manual workflow" option and click the "Configure" button.
4. Paste the contents of [deploy.yml] and click the "Commit changes..." button.

## Profit

Your commits the the `main` branch will now trigger this Action to run, deploying your application to the EC2 instance.
To deploy to Prod, simply add the secret and variable for the Production instance, uncomment out the code in [deploy.yml], and update the script as necessary to not blow away production data.

[Settings page]: https://github.com/JordonWest/wine-api/settings
[Actions Secrets and Variables page]: https://github.com/JordonWest/wine-api/settings/secrets/actions
[Variables page]: https://github.com/JordonWest/wine-api/settings/variables/actions
[Actions page]: https://github.com/JordonWest/wine-api/actions
[deploy.yml]: https://github.com/JordonWest/wine-api/blob/main/.github/workflows/deploy.yml
