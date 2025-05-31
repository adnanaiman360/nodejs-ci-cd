pipeline {
    agent any

    environment {
        DOCKERHUB_CREDS = credentials('dockerhub-creds')
        IMAGE_NAME = "ads12345678/nodejs-ci-cd-demo"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${env.BUILD_NUMBER} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    sh """
                      echo "${DOCKERHUB_CREDS_PSW}" | docker login -u "${DOCKERHUB_CREDS_USR}" --password-stdin
                      docker push "${IMAGE_NAME}:${env.BUILD_NUMBER}"
                      docker tag "${IMAGE_NAME}:${env.BUILD_NUMBER}" "${IMAGE_NAME}:latest"
                      docker push "${IMAGE_NAME}:latest"
                    """
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Skipping tests (no tests defined)'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh """
                      docker rm -f nodejs-app || true
                      docker run -d --name nodejs-app -p 8081:8080 ${IMAGE_NAME}:latest
                    """
                }
            }
        }
    }
}
