pipeline {
    agent any

    stages {
        stage('Install & Run Tests') {
            steps {
                sh 'npm install'
                sh 'npm test'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("mohamum2/my-node-test-sample:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-cred') {
                        docker.image("mohamum2/my-node-test-sample:${env.BUILD_NUMBER}").push()
                    }

                }
            }
        }
    }
}