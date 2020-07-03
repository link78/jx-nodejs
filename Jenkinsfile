stage('Checkout Source Code') {
checkout scm
}

stage('Building Docker Image') {
sh 'docker build -t $DOCKER_ID/jx_testnodejs .'
}
stage('Push Docker image into docker hub'){
sh 'docker login -u $DOCKER_ID -p $Password'
sh 'docker push $DOCKER_ID/jx_testnodejs'
}
stage('Running Angular App') {
sh 'docker run --name ng -d -p 8090:80 $DOCKER_ID/jx_testnodejs'


}


}
