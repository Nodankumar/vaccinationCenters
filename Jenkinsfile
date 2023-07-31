pipeline {
    agent any
	
    environment {
        mavenHome = tool 'jenkins-maven'
    }
	
    tools {
        jdk 'jenkins-java18'
    }
	
    stages {
        stage('Build') {
            steps {
                bat "mvn clean install -DskipTests"
            }
        }
        stage('Test') {
            steps {
                bat "mvn test"
            }
        }
        stage('Deploy') {
            steps {
                bat "mvn deploy"
            }
        }
    }
}
