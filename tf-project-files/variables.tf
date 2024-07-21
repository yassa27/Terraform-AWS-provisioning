# Database password as a sensitive variable
variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
  sensitive   = true  # Sensitive data should not be exposed in logs
}

# AMI ID variable
variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

# EC2 instance type
variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"  # Default instance type
}

# SSH key name for the EC2 instance
variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
}
