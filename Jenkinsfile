node {

   def registryProjet='repository/docker/limam1984/jenkins_image'
   def registryCredential = 'reg1'
   def IMAGE="${registryProjet}:version-${env.BUILD_ID}"

    stage('Clone') {
          git branch: 'main', url:  'https://github.com/limammedsaid/20_JENKINSFILE_PUSH_VERS_REGISTRY_DOCKER.git'
    }

    def img = stage('Build') {
          docker.build("$IMAGE",  '.')
    }

    stage('Run') {
          img.withRun("--name run-$BUILD_ID -p 80:80") { c ->
            sh 'curl localhost'
          }
    }
    stage('Push') {
          docker.withRegistry('https://hub.docker.com', 'reg1') {
              img.push 'latest'
              img.push()
          }
    }

}

