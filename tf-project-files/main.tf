provider "aws" {
  region = "us-east-1"  # Specify the AWS region for resource deployment
}

# VPC creation
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"  # IP address range for the VPC

  tags = {
    Name = "main-vpc"  
  }
}

# Subnet creation within the VPC
resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.main.id  # Link the subnet to the VPC
  cidr_block        = "10.0.1.0/24"    
  availability_zone = "us-east-1a"     

  tags = {
    Name = "main-subnet"  
  }
}

# Security group to control inbound and outbound traffic
resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.main.id  # Link the security group to the VPC

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound SSH traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from any IP address
  }

  tags = {
    Name = "allow-ssh"  # Naming the security group for easy identification
  }
}

# Create an RDS instance for MySQL defining capacity, storage, database engine etc.
resource "aws_db_instance" "db" {
  allocated_storage    = 20             
  storage_type         = "gp2"           
  engine               = "mysql"        
  engine_version       = "8.0"           
  instance_class       = "db.t2.micro"   
  name                 = "mydb"          
  username             = "admin"         
  password             = var.db_password 
  skip_final_snapshot  = true           
  parameter_group_name = "default.mysql8.0" 

  tags = {
    Name = "mydb-instance"  # Naming the DB instance for easy identification
  }
}

# Launch an EC2 instance
resource "aws_instance" "web" {
  ami           = var.ami_id         
  instance_type = var.instance_type  
  subnet_id     = aws_subnet.subnet.id  # Link the instance to the subnet
  key_name       = var.key_name       # SSH key pair name for access

  security_groups = [aws_security_group.allow_ssh.name]  # Attach security group

  tags = {
    Name = "web-instance"  
  }
}
