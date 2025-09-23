# Terraform EC2 Infrastructure Provisioning

## Objective

This project shows how I used Terraform to set up an EC2 instance on AWS. I’ve documented the steps I followed - from setting up my AWS credentials to running Terraform and finally pushing everything to GitHub.

## Steps to Set Up and Deploy the Infrastructure

### 1. **Create an IAM User for Terraform**

- In the **AWS Management Console**, I created an **IAM user** named `terraform-ec2-s3-user`.
- Attached the **AmazonEC2FullAccess** policy to the user.
- After the IAM user is created, I downloaded the **Access Key ID** and **Secret Access Key** for the user.

### 2. **Configure AWS CLI**

- On my local machine, I opened **PowerShell**.
- Run the following command to configure AWS CLI with the new IAM user's credentials: `aws configure`

When prompted, I enter:
•	AWS Access Key ID: (The Access Key ID from the IAM user)
•	AWS Secret Access Key: (The Secret Access Key from the IAM user)
•	Default region name: eu-west-2
• Default output format: json

Verified the configuration was successful by running: `aws configure list`

### 3. **Clone the GitHub Repository**

Opened Git Bash on my local machine.
Cloned the repository containing the Terraform files: git clone https://github.com/your-username/learn-terraform-get-started-aws.git

### 4. **Create Terraform Configuration Files**

Navigate to the cloned repository directory in Sublime Text and created the following Terraform files: `terraform.tf` and `main.tf`

### 5. **Initialize Terraform**

Opened PowerShell and navigated to the directory where the `terraform.tf` and `main.tf` files are located.

Run the following command to initialize the Terraform working directory: terraform init

### 6. **Apply the Terraform Configuration**

Once Terraform has been initialized, i ran the following command to create the infrastructure: `terraform apply`
Reviewed the proposed changes and typed yes when prompted to confirm the application.

### 7. **Push Terraform Configuration Files to GitHub**

After the infrastructure has been created successfully, I commit and push the files to my GitHub repository:

### 8. **Verify the EC2 Instance**

After the Terraform apply completes, I logged into AWS Management Console under EC2 > Instances to confirm that the instance is running.


