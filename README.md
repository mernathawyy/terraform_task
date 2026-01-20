# Terraform VPC Project

This project demonstrates how to create a **VPC in AWS** using Terraform with a modular structure.

---

## Features

- **1 Public Subnet**
- **2 Private Subnets** (using `count`)
- **2 Route Tables** (1 for Public, 1 for Private)
- **Modular Terraform setup** for VPC, Subnets, and Route Tables

---

## Project Structure

```text
terraform_m/
├── main.tf
├── variables.tf
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── subnet/
│   │   ├── main.tf
│   │   └── variables.tf
│   └── route-table/
│       ├── main.tf
│       └── variables.tf
└── README.md
```


**Prerequisites**

Terraform CLI installed

AWS CLI installed and configured

IAM credentials with sufficient permissions

**Deployment Instructions**
Step 1: Initialize Terraform
`terraform init`

Step 2: Preview the Execution Plan
`terraform plan`

Step 3: Apply Terraform Configuration
`terraform apply`


Confirm with yes when prompted.
After this, the VPC, subnets, and route tables will be created in AWS.
Terraform Apply Output
<img width="1920" height="1028" alt="task1gerges part2png" src="https://github.com/user-attachments/assets/f8be16e5-c124-42d6-b40e-56d2dacb74fc" />

**Modules Overview**
VPC Module (modules/vpc)

Creates a VPC

Outputs: vpc_id

Subnet Module (modules/subnet)

Creates 1 public subnet

Creates 2 private subnets using count

**Outputs:**

public_subnet_id

private_subnet_ids (list)

Route Table Module (modules/route-table)

Creates a Route Table

Associates it with subnets (supports multiple subnets via count)

Inputs:

vpc_id

subnet_ids

route_table_name



AWS Console View

<img width="1920" height="1020" alt="task1gerges" src="https://github.com/user-attachments/assets/16db2872-6792-4d72-833b-66ba94297ed7" />


Notes

Public subnet has map_public_ip_on_launch = true

Private subnets do not get public IPs

Modular design allows easy reuse and scalability

Modify CIDRs and AZs in variables.tf

Can configure remote backend (S3 + DynamoDB) for state management


