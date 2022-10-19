resource "aws_launch_template" "main" {
  name = "${local.TAG_PREFIX}-launch-template"

  vpc_security_group_ids = [aws_security_group.main.id]
  instance_type = var.INSTANCE_CLASS
  image_id = data.aws_ami.main.image_id

  iam_instance_profile {
    name = aws_iam_instance_profile.secrets.name
  }
  instance_market_options {
    market_type = "spot"
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = local.TAG_PREFIX
      monitor = "yes"
    }
  }

  tag_specifications {
    resource_type = "spot-instances-request"

    tags = {
      Name = local.TAG_PREFIX
    }
  }

  //user_data = filebase64("${path.module}/example.sh")
}