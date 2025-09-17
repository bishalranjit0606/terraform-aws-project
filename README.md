# 🌐 Terraform AWS Project: Scalable Web Infrastructure

## 🚀 Project Overview
This project demonstrates how to use **Terraform** to create a **scalable and fully functional AWS infrastructure**. The setup includes:

- 🌐 Networking (VPC, subnets, internet gateway, route tables)  
- 🖥️ EC2 instances with Auto Scaling  
- ⚖️ Application Load Balancer (ALB)  
- 🗄️ S3 bucket for storage  

The goal of this project is to showcase **Infrastructure as Code (IaC)** principles and automate deployment in AWS.

---

## ✨ Features

### 🏗️ Networking
- **VPC:** Virtual Private Cloud to host all resources.  
- **Subnets:** Public and private subnets for organizing resources.  
- **Internet Gateway:** Provides internet access to public subnets.  
- **Route Tables:** Direct traffic between subnets and the internet.  

### 🔒 Security
- **Security Groups:** Firewalls for controlling traffic.  
  - ALB SG: Allows HTTP traffic from the internet 🌍.  
  - EC2 SG: Allows traffic from the ALB; SSH disabled 🔑.  

### 🖥️ Compute
- **EC2 Auto Scaling Group:** Launches EC2 instances automatically ⚡.  
- **Launch Template:** Configures EC2 instances and installs Apache web server on startup 🛠️.  

### ⚖️ Load Balancing
- **Application Load Balancer (ALB):** Distributes traffic across EC2 instances 🌐.  
- **Target Group & Listener:** Handles routing of HTTP traffic to the EC2 instances 🔄.  

### 🗄️ Storage
- **S3 Bucket:** Stores static files, logs, or assets securely with public access blocked 🔒.  

---

## 🛠️ Prerequisites

- Terraform >= 1.3.0  
- AWS Account with proper IAM permissions  
- AWS CLI configured with access key and secret key  
- Git (optional, for version control and GitHub)  

---

## 📚 Key Learnings

- Writing **Terraform configuration files** to manage AWS resources 📝.  
- Setting up **VPC, subnets, and route tables** 🌐.  
- Launching **EC2 instances with Auto Scaling** ⚡.  
- Configuring **Application Load Balancer (ALB)** for high availability ⚖️.  
- Creating **secure S3 buckets** for storage 🔒.  
- Understanding **Infrastructure as Code (IaC)** and automation 🤖.  

---

## ✅ Best Practices Followed

- **No hardcoded credentials:** AWS credentials are configured via CLI or environment variables 🔑.  
- **State management:** `.tfstate` files are ignored in GitHub using `.gitignore` 📂.  
- **Security:** SSH is disabled; only HTTP access is allowed through ALB 🔒.  
- **Reusable code:** Variables and modular configuration are used for easy adjustments 🔄.  

---

## 🌟 Future Enhancements

- Add **HTTPS/SSL** for secure web traffic 🔐.  
- Configure **CPU/request-based auto-scaling policies** for the ASG 📈.  
- Update **EC2 user-data** to fetch static content from S3 🖥️.  
- Add **CloudWatch monitoring and alarms** ⏰📊.  
