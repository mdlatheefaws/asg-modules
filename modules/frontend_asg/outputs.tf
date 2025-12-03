output "launch_template_id" { 
    value = aws_launch_template.launch_template.id
     }
output "autoscaling_group_name" { 
    value = aws_autoscaling_group.asg_group.name 
    }
output "scale_out_policy_arn" { 
    value = aws_autoscaling_policy.scale_out.arn
     }
output "scale_in_policy_arn" {
     value = aws_autoscaling_policy.scale_in.arn 
     }
