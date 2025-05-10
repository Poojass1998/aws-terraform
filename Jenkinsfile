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

        stage('Copy secret.tfvars') {
            steps {
                sh 'cp ~/aws-terraform/secret.tfvars $WORKSPACE/'
                sh 'chown jenkins:jenkins $WORKSPACE/secret.tfvars'
                sh 'chmod 600 $WORKSPACE/secret.tfvars'
            }
        }

        stage('Initialize Terraform') {
            steps {
                sh 'ls -l $WORKSPACE/'  // Verify the file exists
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

