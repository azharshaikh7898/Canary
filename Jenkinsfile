pipeline {
  agent any

  stages {
    stage('Build & Test') {
      steps {
        sh 'docker build -t smart-app:$BUILD_NUMBER .'
        sh 'bash scripts/test.sh'
      }
    }

    stage('Deploy Staging') {
      steps {
        sh 'bash scripts/deploy_staging.sh'
      }
    }

    stage('Deploy Canary') {
      steps {
        sh 'bash scripts/deploy_canary.sh'
      }
    }

    stage('Analyze Metrics') {
      steps {
        sh 'bash scripts/analyze_metrics.sh'
      }
    }

    stage('Promote Canary') {
      steps {
        sh 'bash scripts/promote.sh'
      }
    }
  }

  post {
    failure {
      sh 'bash scripts/rollback.sh'
    }
  }
}
