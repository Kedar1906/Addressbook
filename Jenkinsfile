pipeline {
    agent{
        node{
            label 'maven'
            }
    }
    environment{
        PATH = "/opt/apache-maven-3.9.5/bin/mvn:$PATH"
    }
    stages{
        stage("build"){
            steps{
                    echo "------Build step started-----"
                    sh 'mvn clean deploy'
                    echo "------Build step completed-----"
                }

            }
    }


}