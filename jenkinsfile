pipeline {
  agent any

  environment {
    APP_NAME = "smart-app"
  }

  stages {
    stage('Clone') {
      steps {
        checkout scm
      }
    }

    stage('Build Image') {
      steps {
        sh 'docker build -t $APP_NAME:$BUILD_NUMBER .'
      }
    }

    stage('Test') {
      steps {
        sh 'bash scripts/test.sh'
      }
    }

    stage('Deploy Staging') {
      steps {
        sh 'bash scripts/deploy.sh staging'
      }
    }

    stage('Canary Deploy') {
      steps {
        sh 'bash scripts/deploy.sh canary'
        sh 'bash scripts/health_check.sh'
      }
    }
  }

  post {
    failure {
      sh 'bash scripts/rollback.sh'
    }
  }
}

