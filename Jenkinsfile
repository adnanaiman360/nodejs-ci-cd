pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Build Docker image
                    docker.build("ads12345678/nodejs-ci-cd:${env.BUILD_NUMBER}")
                }
            }
        }
        
        stage('Test') {
            steps {
                echo 'Skipping tests - no tests defined'
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    // Stop and remove any running container named nodejs-app (ignore errors)
                    sh 'docker rm -f nodejs-app || true'
                    
                    // Run container exposing port 8080
                    sh 'docker run -d --name nodejs-app -p 8080:8080 your-dockerhub-username/nodejs-app:${env.BUILD_NUMBER}'
                }
            }
        }
    }
}
