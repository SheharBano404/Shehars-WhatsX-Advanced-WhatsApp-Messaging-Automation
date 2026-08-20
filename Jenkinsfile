pipeline {
    agent any
    
    stages {
        stage('Parallel Quality & Security Checks') {
            parallel {
                stage('Lint Check') {
                    steps {
                        echo "Running code linter concurrently..."
                        sh 'sleep 2 && echo "Linting passed."'
                    }
                }
                stage('Unit Tests') {
                    steps {
                        echo "Running unit tests concurrently..."
                        sh 'sleep 3 && echo "Unit tests passed successfully."'
                    }
                }
                stage('Security Scan') {
                    steps {
                        echo "Running security scan concurrently..."
                        sh 'sleep 2 && echo "Security scan clean."'
                    }
                }
            }
        }
        
        stage('Staging Deployment') {
            steps {
                echo "Deploying application to Staging environment..."
                sh 'echo "Staging deploy successful."'
            }
        }
        
        stage('Production Approval & Deployment') {
            steps {
                script {
                    // Scripted block ke andar input step behtareen tareeqay se UI par render hota hai
                    def userInput = input(
                        message: "Approve deployment to Production?",
                        ok: "Deploy to Prod",
                        parameters: [
                            booleanParam(defaultValue: true, description: 'Confirm deployment', name: 'CONFIRM_PROD')
                        ]
                    )
                    echo "User input received: ${userInput}"
                }
                echo "Approval received! Deploying to Production..."
                sh 'echo "Production deployment completed successfully."'
            }
        }
    }
    
    post {
        success {
            echo "Pipeline finished successfully across all stages!"
        }
        failure {
            echo "Pipeline failed or aborted!"
        }
    }
}