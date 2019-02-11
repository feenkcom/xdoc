pipeline {
    agent any
    options { 
        disableConcurrentBuilds() 
    }
    stages {
        stage('Load') {
            steps {
                sh 'git clean -f -d'
                sh 'rm -rf pharo-local/*'
                sh 'chmod +x build/*.sh'
                sh 'build/load.sh'
            }
        }
        stage('Run examples') {
            steps {
                sh 'build/test.sh'
                junit '*.xml'
            }
        }
        stage('Build xdoc-server') {
            steps {
                build(job: '../xdoc-server/master', wait: false)
            }
        }
        stage('Build gtoolkit') {
            when { expression {
                    env.BRANCH_NAME.toString().equals('master') && (env.TAG_NAME == null)
                }
            }
            steps {
                build(job: '../gtoolkit/master', wait: false)
            }
        }
    }
}