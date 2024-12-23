pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'shaikhs9/pwtask2'  // Change to your Docker Hub image name
        DOCKER_CREDENTIALS = credentials('docker-username-pass')  // Change to your Jenkins Docker username and PAT credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub using Docker Hub username and PAT
                    withCredentials([usernamePassword(credentialsId: 'docker-username-pass', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Log in to Docker using the username (Docker Hub) and PAT (Personal Access Token)
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"
                    }

                    // Push the image to Docker Hub
                    sh "docker push ${DOCKER_IMAGE}:${BUILD_NUMBER}"
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker images after the build
            sh "docker rmi ${DOCKER_IMAGE}:${BUILD_NUMBER} || true"
        }
    }
}
