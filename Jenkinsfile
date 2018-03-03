node {
  def mvnHome
  def app
  def commitHash
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/tsomal/spring-boot-hello-world.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool 'M3'
      commitHash = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
   }
   stage('Build') {
      // Run the maven build
       if (isUnix()) {
          sh "'${mvnHome}/bin/mvn' clean compile package "
        // echo 'hello world'
       } else {
          bat(/"${mvnHome}\bin\mvn" -Dmaven.test.failure.ignore clean package/)
       }
    echo "Built......."
   }
  stage('Build Docker') {
      // Run the maven build
       if (isUnix()) {
         app = docker.build("localhost:5000/hello-world-${commitHash}")
          app.push();
       }
   
   }
   stage('List Images') {
      //sh "'docker tag hello-world localhost:5000/hello-world-private-registry'"
     sh "curl -X GET http://registry:5000/v2/_catalog" 
     
   }
   stage('Results') {
    echo "Tests Ran..."
   }
}
