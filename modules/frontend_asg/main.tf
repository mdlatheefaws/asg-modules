resource "aws_launch_template" "launch_template" {
  name_prefix   = var.name_prefix != "" ? "${var.name_prefix}-lt-" : "frontend-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  
  vpc_security_group_ids = var.security_group_ids

  user_data = base64encode(file(var.user_data_file))

  tag_specifications {
    resource_type = "instance"
    tags = merge({ Name = var.instance_name }, var.tags)
  }
}

resource "aws_autoscaling_group" "asg_group" {
  name                      = var.asg_name
  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  force_delete              = var.force_delete
  health_check_type         = var.health_check_type
  health_check_grace_period = var.health_check_grace_period
  target_group_arns = var.target_group_arns
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

#   tags = [
#     for k, v in merge({ Name = var.instance_name }, var.tags) : {
#       key                 = k
#       value               = v
#       propagate_at_launch = true
#     }
#   ]
}

resource "aws_autoscaling_policy" "scale_out" {
  name                   = "${var.asg_name}-scale-out"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = var.scale_out_adjustment
  cooldown               = var.scale_out_cooldown
  autoscaling_group_name = aws_autoscaling_group.asg_group.name
  policy_type            = "SimpleScaling"
}

resource "aws_autoscaling_policy" "scale_in" {
  name                   = "${var.asg_name}-scale-in"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = var.scale_in_adjustment
  cooldown               = var.scale_in_cooldown
  autoscaling_group_name = aws_autoscaling_group.asg_group.name
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${var.asg_name}-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.alarm_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.alarm_period
  statistic           = "Average"
  threshold           = var.alarm_high_threshold

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg_group.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_out.arn]
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "${var.asg_name}-cpu-low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.alarm_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.alarm_period
  statistic           = "Average"
  threshold           = var.alarm_low_threshold

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg_group.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_in.arn]
}
