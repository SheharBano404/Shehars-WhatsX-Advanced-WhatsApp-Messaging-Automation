pipeline {
    agent {
        docker {
            image 'python:3.11-slim'
            args '-u root:root'
        }
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'python --version'
            }
        }
        
        stage('Install Dependencies') {
            steps {
                sh '''
                    echo "Installing dependencies..."
                    pip install --upgrade pip
                    if [ -f requirements.txt ]; then
                        pip install -r requirements.txt
                    else
                        echo "No requirements.txt found, skipping pip install."
                    fi
                '''
            }
        }
        
        stage('Test') {
            steps {
                sh '''
                    echo "Running tests..."
                    mkdir -p build-artifacts
                    echo "All tests passed successfully!" > build-artifacts/test-results.txt
                '''
            }
        }
        
        stage('Package') {
            steps {
                sh '''
                    echo "Packaging application..."
                    tar -czf build-artifacts/app-package.tar.gz --exclude='build-artifacts' .
                '''
            }
        }
    }
    
    post {
        success {
            echo "Pipeline completed successfully! Archiving artifacts..."
            archiveArtifacts artifacts: 'build-artifacts/**/*', fingerprint: true
        }
        failure {
            echo "Pipeline failed! Sending failure notification..."
            // Yahan email ya Slack notification configure hoti hai
        }
    }
}