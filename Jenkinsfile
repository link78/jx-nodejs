pipeline {

  environment {
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/link78/jx-nodejs.git'
      }
    }


    stage('Build and Push Image') {
      steps{
        script {
          docker.withRegistry( "https://registry.hub.docker.com","DOCKER_ID" ) {
            dockerImage = docker.build("burk1212/jx-nodejs:${env.BUILD_NUMBER}")
            dockerImage.push("latest")
          }
        }
      }
    }
    stage('Removing Previous Container Name'){
      steps{
      sh label: '',script: 'docker rm -f jx'
      }
    }
    stage('Deploy App') {
      steps { 
        
       sh label: '',script: 'docker run --name jx -d -p 8095:8000 burk1212/jx-nodejs'
        
      }
    }
 }
}
