# Terraform EC2 Infrastructure Provisioning

## Objective

This project demonstrates how to provision an EC2 instance using Terraform and AWS. It outlines the steps to configure AWS credentials, initialize Terraform, apply the configuration, and push the changes to GitHub.

## Steps to Set Up and Deploy the Infrastructure

### 1. **Create an IAM User for Terraform**

- In the **AWS Management Console**, create an **IAM user** named `terraform-ec2-s3-user`.
- Attach the **AdministratorAccess** policy to the user or create a custom policy that grants permissions to manage EC2 instances and other necessary resources.
- After the IAM user is created, download the **Access Key ID** and **Secret Access Key** for the user.

### 2. **Configure AWS CLI**

- On your local machine, open **PowerShell**.
- Run the following command to configure your AWS CLI with the new IAM user's credentials:
  ```bash
  aws configure


When prompted, enter:
•	AWS Access Key ID: (The Access Key ID from the IAM user)
•	AWS Secret Access Key: (The Secret Access Key from the IAM user)
•	Default region name: eu-west-2 (or your preferred region)
• Default output format: json

Verify that your configuration was successful by running: aws configure list

3. Clone the GitHub Repository

Open Git Bash on your local machine.
Clone the repository containing your Terraform files: git clone https://github.com/your-username/learn-terraform-get-started-aws.git

4. Create Terraform Configuration Files

Navigate to the cloned repository directory in Sublime Text and create the following Terraform files:

5. Initialize Terraform

Open PowerShell and navigate to the directory where your terraform.tf and main.tf files are located.

Run the following command to initialize the Terraform working directory: terraform init

6. Apply the Terraform Configuration

Once Terraform has been initialized, run the following command to create the infrastructure (an EC2 instance in this case): terraform apply
Review the proposed changes (it will show you a plan of the resources Terraform is going to create).
Type yes when prompted to confirm the application.

7. Push Terraform Configuration Files to GitHub

After the infrastructure has been created successfully, commit and push the files to your GitHub repository:

8. Verify the EC2 Instance

After the Terraform apply completes, you should see your EC2 instance running in the AWS Management Console under EC2 > Instances.

