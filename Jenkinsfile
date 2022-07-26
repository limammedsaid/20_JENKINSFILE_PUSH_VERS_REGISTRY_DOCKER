 def registryProjet='limam1984/jenkins_image'
 def registryCredential = 'reg1'
 def IMAGE="${registryProjet}:version-${env.BUILD_ID}"
node {    
      def app     
      stage('Clone repository') {               
             
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
       stage('Push image') {
          docker.withRegistry('https://registry.hub.docker.com', 'reg1') {    
          img.push ("${env.BUILD_NUMBER}")            
          img.push()     
              }    
           }
        }