pipeline {

  environment {
    dockerImage = ""
    DOCKER_IMAGE_NAME= "burk1212/k8sdemo"
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
            dockerImage = docker.build(DOCKER_IMAGE_NAME)
            dockerImage.push("${env.BUILD_NUMBER}")                         
            dockerImage.push("latest")
          }
        }
      }
    }
   // stage('Removing Previous Container Name'){
    //  steps{
    //  sh label: '',script: 'docker rm -f jx'
     // }
   // }
    stage('Deploy App') {
      steps { 
        
       sh label: '',script: 'docker run --name jx -d -p 8095:8000 burk1212/k8sdemo'
        
      }
    }
    stage('Deploy App to K8s') {
      steps {
        script {
          kubernetesDeploy(configs: "deployapp.yaml", kubeconfigId: "kubeconfig_id",enableConfigSubstitution: true)
        }
      }
    }
 }
}
