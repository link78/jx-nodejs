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

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build("burk1212/jx-nodejs:$BUILD_NUMBER"
                   
        }
      }
    }

    stage('Push Image') {
      steps{
        script {
          docker.withRegistry( "https://registry.hub.docker.com","DOCKER_ID" ) {
            dockerImage.push("latest")
          }
        }
      }
    }

    stage('Deploy App') {
      steps { 
        sh 'docker run --name jx -d -p 8095:8000 burk1212/jx-nodejs'
        
      }
    }

  

}
