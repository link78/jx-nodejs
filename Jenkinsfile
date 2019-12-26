pipeline {
  agent any

  stages {
    stage('build') {
      steps {
        container('nodejs') {
          sh "node --version"
          sh 'apk update && apk add docker'
          sh 'docker --version'
          
        }
      }
    }
    stage('build image'){
        steps{
            container('nodejs') {
            sh "docker login -u burk1212 -p xyyxxyxyyx"
            sh "docker build -t burk1212/my-nodejs-app ."
        }
     }
    }
    stage('pushing image'){
        steps{
            container('nodejs') {
            sh "docker push burk1212/my-nodejs-app"
        }
     }
    }
    
    
   
  }
}


