# How to set up automated docker-compose deploy with GitHub Actions

## Setting up Actions Runner on EC2 Instance

sudo yum install -y git && \
sudo yum install libicu -y && \
sudo yum install docker -y && \
sudo service docker start && \
sudo usermod -aG docker $USER  && \
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && \
sudo chmod +x /usr/local/bin/docker-compose && \
newgrp docker


something
