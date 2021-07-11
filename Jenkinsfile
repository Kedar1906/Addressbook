pipeline {
    agent any
    tools{
        maven 'MAVEN_HOME' 
        jdk 'JAVA_HOME';
    }
    stages{
        stage('build'){
            steps{
                sh 'mvn clean package'
            }
        }
    }

}