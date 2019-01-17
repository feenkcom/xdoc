pipeline {
    agent any
    stages {
        stage('Load') {
            steps {
                sh 'git clean -f -d'
                sh 'chmod +x build/*.sh'
                sh 'build/load.sh'
            }
        }
        stage('Run examples') {
            steps {
                sh 'chmod +x build/test.sh'
                sh 'build/test.sh'
                junit '*.xml'
            }
        }
    }
}