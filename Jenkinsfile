node {
  def mvnHome
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/tsomal/spring-boot-hello-world.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool 'M3'
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
   stage('Results') {
    echo "Tests Ran..."
   }
}
