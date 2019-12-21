pipeline {
  agent any 
  stages {
    stage('cloning git repo') {
      steps {
        git 'https://https://github.com/link78/jx-nodejs.git'
       }
     }
   stage('Build') {
    steps {
        sh 'npm install'
        }
      }
    stage('Install nodemon'){
       steps {
        sh 'npm install nodemon'
        }
      }
    }
  }
