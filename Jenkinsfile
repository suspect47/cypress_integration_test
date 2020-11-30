#!/usr/bin/env groovy

pipeline {
    options {
        buildDiscarder(logRotator(numToKeepStr: '3', artifactNumToKeepStr: '3'))
    }
    agent {
        label 'QA_build-linux-x64'
    }
    parameters {
        string (name: 'HOST', defaultValue: '')
        string (name: 'USERNAME', defaultValue: '')
        string (name: 'PASSWORD', defaultValue: '')
        choice(name: 'BROWSER', choices: ['CHROME', 'FIREFOX'])
    }    
    stages {
        stage ('Git') {
            steps {
            git (url:'my_url', credentialsId: '19a6d233-4e91-4567-a67e-5a1211786063')
            }
        }
        stage ('Tests') {
            steps {
            sh 'bash $WORKSPACE/jenkinsjob.sh'
            }
        }
    }
    post {
        always {
	archiveArtifacts artifacts: 'cypress/cypress/videos/**/*.mp4, cypress/cypress/screenshots/**/*.png', caseSensitive: false, defaultExcludes: false, followSymlinks: false
        }
        failure {
	rocketSend channel: '#build', message: 'Cypress integration test has been failed :(', serverUrl: 'my_url', trustSSL: true
	}
    }
}
