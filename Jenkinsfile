pipeline {
    agent any

    stages {
        stage('Pull Code from Git') {
            steps {
                git 'https://github.com/Mubashir-M/my-node-tests-sample.git'
            }
        }

        stage('Run Tests') {
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
                    docker.withRegistry('https://registry.hub.docker.com', '')
                    docker.image("mohamum2/my-node-test-sample:${env.BUILD_NUMBER}").push()
                }
            }
        }
    }
}