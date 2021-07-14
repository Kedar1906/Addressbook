pipeline {
    agent any

    tools {
        maven 'Maven'
    }

    stages{
        stage("Maven Build"){
            steps{
                sh "mvn clean install package"
            }
        }
        stage("Copy Artifcact"){
            steps{
                sshPublisher(publishers: [sshPublisherDesc(configName: 'Ansible_host', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/opt/address-book', remoteDirectorySDF: false, removePrefix: 'target/', sourceFiles: '**/*.war'), sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/opt/address-book', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'Dockerfile')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
    }

}