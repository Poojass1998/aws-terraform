pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'master', url: 'https://github.com/Poojass1998/aws-terraform.git'
            }
        }

        stage('Initialize Terraform') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Validate Terraform') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Plan Terraform') {
            steps {
                sh 'terraform plan -var-file=secret.tfvars'
            }
        }

        stage('Terraform Apply (Master Only)') {
            when {
                branch 'master' // Only run this stage for the master branch
            }
            steps {
                sh 'terraform apply -var-file=secret.tfvars -auto-approve'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '**/*.tfstate', fingerprint: true
        }
        success {
            echo "Terraform deployment successful!"
        }
        failure {
            echo "Terraform deployment failed!"
        }
    }
}

