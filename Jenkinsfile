#!/bin/groovy

pipeline {
    agent {
        docker {
            image 'nagibator1992/jenkins-android:1.0.0'
            label 'мастер'
        }
    }
    stages {
        stage('build') {
            steps {
                sh './gradlew :app:assembleDebug'
            }
        }
        stage('test') {
            steps {
                sh './gradlew :app:testDebugUnitTest'
            }
        }
        stage('deploy') {
            steps {
                archiveArtifacts artifacts: 'app/build/outputs/'
            }
        }
    }
}