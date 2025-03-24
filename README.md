# aws-terraform
AWS Three-Tier Architecture with Terraform

Overview:
The AWS-Terraform repository contains Infrastructure as Code (IaC) configurations for deploying an AWS Three-Tier Architecture using Terraform. This setup includes an automated CI/CD pipeline with Jenkins to manage infrastructure updates efficiently.

Architecture Components
![Alt Text](https://github.com/user-attachments/assets/6ce1a0b7-df62-4eae-8ce1-061ca257b11b)

Technologies Used:
Terraform: Infrastructure as Code (IaC)
AWS: EC2, RDS, S3, VPC, ALB, IAM, Auto Scaling
Jenkins: CI/CD pipeline automation
GitHub: Version control for Terraform configurations

Setup Instructions:

Prerequisites:
AWS CLI configured with necessary permissions
Terraform installed (v1.x.x recommended)
Jenkins installed and configured with GitHub and AWS credentials

Deployment Steps:

Clone the repository

git clone https://github.com/Poojass1998/aws-terraform.git
cd aws-terraform

Pipeline Execution: Jenkins will automatically trigger Terraform runs when changes are pushed to GitHub.

Initialize Terraform
terraform init

Validate Configuration
terraform validate

Plan the Deployment
terraform plan -out=tfplan

Apply Changes
terraform apply tfplan

Verify the Deployment
Check AWS console for deployed resources

To delete all resources:
terraform destroy
