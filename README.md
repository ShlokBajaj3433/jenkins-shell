# Jenkins Shell Project

A simple shell-script project with Docker and Jenkins pipeline support.

## Project Overview

This project runs one shell script:

- script.sh prints a message: Hello from Shell Script project!

The project also includes:

- Dockerfile to build and run the script in a container
- Jenkinsfile to build the Docker image and run the container in CI

## Project Structure

```text
project4-shell/
  Dockerfile
  Jenkinsfile
  README.md
  script.sh
```

## Prerequisites

Install the following tools:

- Git (optional, for cloning)
- Docker
- Jenkins (optional, for CI/CD execution)

For local script execution (without Docker), use one of:

- Linux or macOS terminal
- Git Bash on Windows
- WSL on Windows

## Run Locally (Without Docker)

From the project4-shell directory:

```bash
chmod +x script.sh
./script.sh
```

Expected output:

```text
Hello from Shell Script project!
```

On Windows PowerShell, run via Git Bash or WSL:

```powershell
bash ./script.sh
```

## Run with Docker

### 1. Build the image

```bash
docker build --no-cache -t my-app .
```

### 2. Run the container

```bash
docker run --rm my-app
```

Expected output:

```text
Hello from Shell Script project!
```

## Run Jenkins Inside Docker

Use this setup when you want Jenkins itself to run in Docker and execute this project pipeline from there.

### 1. Start Jenkins container

```powershell
docker volume create jenkins_home

docker run -d --name jenkins `
  -p 8080:8080 -p 50000:50000 `
  -v jenkins_home:/var/jenkins_home `
  -v c:/codes/Jenkins:/workspace `
  jenkins/jenkins:lts-jdk17
```

### 2. Install shell tools inside Jenkins container

```powershell
docker exec -u 0 jenkins sh -c "apt-get update && apt-get install -y bash coreutils"
```

### 3. Open Jenkins and unlock

- URL: http://localhost:8080
- Get admin password:

```powershell
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

Install suggested plugins and complete the first admin user setup.

## Jenkins Pipeline (Inside Docker Jenkins)

The Jenkinsfile has two stages:

1. Checkout
2. Run Script

### Create Jenkins job for this project

1. Create a new Pipeline job.
2. Choose Pipeline script from SCM.
3. SCM: Git
4. Repository URL: https://github.com/ShlokBajaj3433/jenkins-shell.git
5. Branch: main
6. Script Path: Jenkinsfile
7. Click Build Now.

### Notes

- This setup does not require Docker socket access for Jenkins builds.
- The pipeline directly runs the shell script inside Jenkins.

## Troubleshooting

- Permission denied on script:
  - Run chmod +x script.sh
- docker: command not found:
  - This pipeline no longer uses Docker in Jenkins

## Keep It Simple and Standard

- Script logic is minimal and clear
- Dockerfile is still available for local container testing
- Jenkins pipeline uses straightforward checkout and script execution
