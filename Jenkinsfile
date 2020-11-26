

pipeline {
  agent any

  stages {
    stage('checkout code') {
     checkout scm
    }
    stage('build image'){         
            sh 'docker login -u $DOCKER_ID -p $Password'
            sh 'docker build -t $DOCKER_ID/jx_testnodejs .' 
    }
    stage('pushing image'){
             
            sh "docker push $DOCKER_ID/jx_testnodejs" 
    }
    stage('Running nodejs app'){
      sh 'docker run --name ng -d -p 8000:80 $DOCKER_ID/jx_testnodejs'
    }
  }
}
