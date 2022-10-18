resource "aws_launch_template" "main" {
  name = "${local.TAG_PREFIX}-launch-template"

  vpc_security_group_ids = [aws_security_group.main.id]
  instance_type = var.INSTANCE_CLASS
  image_id = data.aws_ami.main.image_id

  iam_instance_profile {
    name = "test"
  }
  instance_market_options {
    market_type = "spot"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "test"
    }
  }

  user_data = filebase64("${path.module}/example.sh")
}