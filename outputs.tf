output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets_ids" {
  value = module.subnet_public.public_subnets_ids
}

output "igw_id" {
  value = module.igw.igw_id
}

output "public_route_table_id" {
  value = module.igw.public_route_table_id
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

output "asg_name" {
  value = module.frontend_asg.autoscaling_group_name
}
