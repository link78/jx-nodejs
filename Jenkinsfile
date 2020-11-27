pipeline {
    agent any

    stages {
        stage('Check out code') {
            steps {
                 checkout scm
            }
        }
        stage('Build Docker image') {
            steps {
                 sh 'docker login -u $DOCKER_ID -p $Password'
                 sh 'docker build -t $DOCKER_ID/jx_testnodejs .'
            }
        }
        
        stage('Push container') {
            steps {
                sh "docker push $DOCKER_ID/jx_testnodejs" 
            }
        }
        stage('Remove old container') {
            steps {
         
            }
        }
        stage('Deploy container') {
            steps {
                sh 'docker run --name ng -d -p 8020:8000 $DOCKER_ID/jx_testnodejs'
                sh 'docker ps'
            }
        }
    }
}
