resource "aws_autoscaling_group" "asg" {
  desired_capacity   = var.ASG_DESIRED
  max_size           = var.ASG_MAX
  min_size           = var.ASG_MIN
  vpc_zone_identifier= var.PRIVATE_SUBNET_ID[0]
  target_group_arns  = [aws_lb_target_group.main-tg.arn]

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }
}