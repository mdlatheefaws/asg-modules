output "alb_arn" {
  value = aws_lb.this.arn
}

output "alb_dns" {
  value = aws_lb.this.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.tg.arn
}

output "alb_security_group_id" {
  value = aws_security_group.alb_sg.id
}
