# Infrastructure as Code (IaC) with Terraform and AWS

This project demonstrates how to use Terraform to manage and deploy infrastructure on AWS. It sets up a basic EC2 instance with a security group for web access.

## Project Structure

terraform-aws-provisioning/
├── tf-project-files/
│ ├── main.tf
│ ├── outputs.tf  
│ ├── terraform.tfvars
│ ├── variables.tf
├── .gitignore
└── README.md

## Project Perequisites and steps to follow


- **`tf-project-files/`**: Contains all Terraform configuration files.
  - **`main.tf`**: Defines the main infrastructure resources.
  - **`variables.tf`**: Contains variables for customisation.
  - **`outputs.tf`**: Specifies output values from Terraform.
  - **`terraform.tfvars`**: Provides values for variables defined in `variables.tf`.
  - **`provider.tf`**: Configures the provider settings.

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.
- AWS CLI configured with your AWS credentials.

### Setup and Deployment

1. **Navigate to the Terraform directory**:

    ```sh
    cd tf-project-files
    ```

2. **Initialise Terraform**:

    ```sh
    terraform init
    ```

3. **Review the planned changes**:

    ```sh
    terraform plan
    ```

4. **Apply the configuration**:

    ```sh
    terraform apply
    ```

   - Confirm the action by typing `yes` when prompted.

5. **Verify Deployment**:

   - Check the AWS Management Console for your new EC2 instance and security group.

## Cleanup

To destroy the resources created by Terraform:

```sh
terraform destroy
```

### use gitignore for data protection
Ensure sensitive files and unnecessary files are excluded from version control


### Notes
Ensure terraform.tfvars is not exposed publicly as it may contain sensitive information.

The terraform.tfvars should contain your database secure password, AMI ID and key pair name.

Customise variables in terraform.tfvars as needed for your environment.
