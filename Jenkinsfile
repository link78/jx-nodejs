pipeline {

  environment {
    registry = "burk1212/jx-nodejs"
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
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
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
        
        sh ' shdocker run --name jx -d -p 8095:8000 burk1212/jx-nodejs'
        
      }
    }

  }

}
