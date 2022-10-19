resource "aws_autoscaling_group" "asg" {
  desired_capacity   = var.ASG_DESIRED
  max_size           = var.ASG_MAX
  min_size           = var.ASG_MIN
  vpc_zone_identifier= var.PRIVATE_SUBNET_ID
  target_group_arns  = [aws_lb_target_group.main-tg.arn]

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_policy" "example" {
  autoscaling_group_name = aws_autoscaling_group.asg.name
  name                   = "whenCPULoadIncrease"
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50
  }
}