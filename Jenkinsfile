node {
  checkout scm
 
  
  stage('Building and Pushing Image'){
         // This step should not normally be used in your script. Consult the inline help for details.
docker.withRegistry('https://registry.hub.docker.com','Burk1212') {

  IMAGE_NAME="burk1212/cicd-node-test:${env.BUILD_NUMBER}"
  def customImage = docker.build(IMAGE_NAME)
    
    customImage.push('latest')
        }
  }
     stage('Remove old image container'){
    
      sh label: '', script: 'docker rm -f cicd-test' 
      
  }
  stage('Running latest images on docker'){
    
    sh label: '', script: 'docker run --name=cicd-test -d -p 7500:8000 burk1212/cicd-node-test' 
  }
 
  
 
} // end
