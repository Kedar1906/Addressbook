pipeline {
    agent any
    tools{
        Maven 'MAVEN_HOME'
        Java 'JAVA_HOME'
    }
    stages{
        stage('Build'){
            steps{
                sh 'mvn clean package'
            }
        }
    }

}