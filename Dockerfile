FROM jenkins/jenkins:lts

# Switch to root to install system dependencies
USER root

RUN apt-get update && apt-get install -y \
    git \
    docker.io \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Switch back to jenkins user
USER jenkins

# Install main plugins
RUN jenkins-plugin-cli --plugins \
    blueocean:latest \
    workflow-aggregator:latest \
    git:latest \
    github:latest \
    pipeline-github-lib:latest \
    docker-workflow:latest \
    pipeline-stage-view:latest \
    credentials-binding:latest \
    ssh-agent:latest \
    matrix-auth:latest \
    ldap:latest \
    email-ext:latest \
    mailer:latest
