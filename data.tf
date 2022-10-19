data "aws_ami" "main" {
  most_recent      = true
  name_regex       = "${var.COMPONENT}-ami-${var.APP_VERSION}"
  owners           = ["self"]
}

data "aws_secretsmanager_secret" "secret" {
  name = "roboshop/all"
}

data "aws_secretsmanager_secret_version" "secret" {
  secret_id = data.aws_secretsmanager_secret.secret.id
}

