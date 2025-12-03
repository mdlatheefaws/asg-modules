# VPC
module "vpc" {
  source      = "./modules/vpc"
  cidr        = var.vpc_cidr
  project     = var.project
  environment = var.environment
}

# Single public subnet
module "subnet_public" {
  source             = "./modules/subnet_public"
  vpc_id             = module.vpc.vpc_id
  public_subnet1_cidr = var.public_subnet1_cidr
  public_subnet1_az  = var.public_subnet1_az
  public_subnet2_cidr = var.public_subnet2_cidr
  public_subnet2_az  = var.public_subnet2_az
  project            = var.project
  environment        = var.environment
}

# IGW + public RT + assoc
module "igw" {
  source           = "./modules/igw"
  vpc_id           = module.vpc.vpc_id
  public_subnet1_id = module.subnet_public.public_subnet1_id
  public_subnet2_id = module.subnet_public.public_subnet2_id
  project          = var.project
  environment      = var.environment
}

# Security group
module "security_group" {
  source = "./modules/security_group"

  vpc_id      = module.vpc.vpc_id
  sg_name     = "${var.project}-${var.environment}-web-sg"
  description = "web sg for SSH/HTTP/HTTPS"

  # IMPORTANT: replace with your IP/32 for SSH in production
  ssh_cidrs  = ["0.0.0.0/0"]  # demo only
  http_cidrs = ["0.0.0.0/0"]
  https_cidrs = ["0.0.0.0/0"]
}

# Frontend ASG
module "frontend_asg" {
  source = "./modules/frontend_asg"
  name_prefix   = var.project
  instance_name = "${var.project}-frontend"
  ami_id        = var.ami_id
  instance_type = var.ec2_instance_type
  key_name      = var.key_name
  security_group_ids = [module.security_group.security_group_id]
  target_group_arns = [module.alb.target_group_arn]
  user_data_file = "${path.root}/Frontend.sh"
  asg_name         = "${var.project}-frontend-asg"
  max_size         = 2
  min_size         = 1
  desired_capacity = 1
  force_delete     = true
  health_check_grace_period = 300
  subnet_ids = [module.subnet_public.public_subnet_id]  # single subnet
  tags = {
    Project = var.project
    Env     = var.environment
  }
}
module "alb" {
  source = "./modules/alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = [module.subnet_public.public_subnet_id]  # list with single subnet
  project           = var.project
  environment       = var.environment

  # keep open for demo; restrict if required
  http_cidrs = ["0.0.0.0/0"]
}
