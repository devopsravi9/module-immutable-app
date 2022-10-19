variable "COMPONENT" {}
variable "ENV" {}
variable "APP_VERSION" {}
variable "APP_INSTANCE_CLASS" {}
variable "PRIVATE_ZONE_ID" {}
variable "WORKSTATION_IP" {}
variable "PROMETHEUS_IP" {}
variable "APP_PORT" {}

variable "ASG_DESIRED" {}
variable "ASG_MAX" {}
variable "ASG_MIN" {}

variable "PRIVATE_SUBNET_ID" {}
variable "PRIVATE_LB_DNS" {}
variable "VPC_ID" {}

variable "ALLOW_SG_CIDR" {}
variable "PUBLIC_LB_ARN" {}
variable "PRIVATE_LISTNER_ARN" {}

variable "DOCDB_ENDPOINT" {
  default = "null"
}
variable "REDDIS_ENDPOINT" {
  default = "null"
}
variable "MYSQL_ENDPOINT" {
  default = "null"
}




