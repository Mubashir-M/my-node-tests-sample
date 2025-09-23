# CI Pipeline with Jenkins, Docker, and GitHub

## Introduction

This project demonstrates a complete Continuous Integration (CI) pipeline using Jenkins. The pipeline automates the process of pulling code from GitHub, running tests, building a Docker image, and pushing that image to Docker Hub. This ensures that every code change is automatically validated and packaged for deployment.

## Core Technologies

- Jenkins: The automation server orchestrating the pipeline.

- Docker: Used to containerize the application for consistent builds and deployments.

- GitHub: The source code repository.

- AWS EC2: The virtual server hosting the Jenkins instance.

- Docker Hub: The repository for storing the final Docker images.

## Pipeline Flow

![image alt](https://github.com/Mubashir-M/my-node-tests-sample/blob/86275677c1a2f305ae61603b168eb5799289caa6/Screenshot%202025-09-23%20at%2016.52.59.png)

### Step-by-Step Description:

1. A developer pushes code to the main branch of the GitHub repository.

2. A GitHub webhook notifies Jenkins of the new commit.

3. The Jenkins pipeline is automatically triggered.

4. Stage 1: Pull Code: Jenkins clones the latest code from the GitHub repository.

5. Stage 2: Run Tests: The pipeline executes the automated tests within the project to ensure the code is stable.

6. Stage 3: Build Docker Image: If the tests pass, the pipeline uses the Dockerfile to create a new Docker image of the application.

7. Stage 4: Push to Docker Hub: The newly built Docker image is tagged and pushed to Docker Hub, making it available for deployment.

## Setup & Configuration

1. **AWS EC2 Setup**

   - Launched a t3.medium EC2 instance with Ubuntu Server 20.04 LTS.

   - Configured inbound rules to allow traffic on ports 22 (SSH) and 8080 (Jenkins).

2. **Jenkins Installation**

   - Connected to the EC2 instance via SSH.

   - Installed Java and Jenkins using apt-get.

   - Installed Docker and added the jenkins user to the docker group.

3. **Jenkins Job Configuration**

   - Created a Pipeline job in Jenkins.

   - Configured the job to read the Jenkinsfile from the GitHub repository.

   - Added Docker Hub credentials to Jenkins.

   - Enabled the GitHub hook trigger to automate builds.

4. **GitHub Repository**

   - The project includes a Dockerfile to define the container image.

   - The Jenkinsfile in the repository root defines the entire CI pipeline.

   - A webhook was created in the repository settings to send push events to the Jenkins server.
