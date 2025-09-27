# 📦 Terraform AWS S3 Static Website Hosting

This project provisions a static website hosted on an AWS S3 bucket using Terraform. It includes full configuration for website hosting, public access, versioning, bucket policies, and ownership controls.

---

## 🚀 What This Project Does

- Creates an S3 bucket with a custom name
- Enables static website hosting (with index and error documents)
- Configures **ownership controls** for the bucket
- Disables **block public access** settings so the website is reachable
- Applies **public-read ACL** to allow object access
- Enables **versioning** on the bucket
- Attaches a **bucket policy** to allow public access to website files

---

## 🧱 Technologies Used

- **Terraform v1.x**
- **AWS Provider v6.x**
- **S3** (Amazon Simple Storage Service)

---

## 🛠 How to Use

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/terraform-s3-static-website.git
cd terraform-s3-static-website
```
### 2. Initialize and Deploy
```
terraform init
terraform plan
terraform apply
```
Once deployed, you can visit your static website at:
```
http://<your-bucket-name>.s3-website-<region>.amazonaws.com
```
## 📌 Notes

- The bucket must have a globally unique name.
- The bucket is configured to allow public read access for website content. Be careful with this in production environments.
- Terraform ensures all required dependencies (ownership controls, ACLs, public access block) are properly ordered using depends_on.
- versioning is enabled to keep track of object changes in the bucket.

## 📘 What I Learned

- How to map AWS Console features (like website hosting, ACLs, ownership controls) into Terraform resources
- The correct structure and naming conventions for AWS S3 resources in Terraform
- Managing public access securely via ACLs, policies, and block access settings
- How Terraform helps catch missing configuration through meaningful errors

## 📸 Screenshots

