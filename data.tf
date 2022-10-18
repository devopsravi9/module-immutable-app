data "aws_ami" "main" {
  most_recent      = true
  name_regex       = "${var.COMPONENT}-ami-${var.APP_VERSION}"
  owners           = ["self"]
}