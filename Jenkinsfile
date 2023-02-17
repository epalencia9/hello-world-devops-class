pipeline {
  agent any
  tools {
    maven 'maven' 
  }
  stages {
    stage ('Build') {
      steps {
        sh 'mvn clean install'
      }
    }
    stage ('Deploy') {
      steps {
        script {
          deploy adapters: [tomcat8(credentialsId: 'deployer', path: '', url: 'http://13.56.184.65:8080/')], contextPath: '', onFailure: false, war: '**/*.war' 
        }
      }
    }
  }
}
