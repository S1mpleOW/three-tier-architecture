provider "aws" {
  region = var.region
}

module "VPC" {
  source                    = "../../modules/vpc"
  project_name              = var.project_name
  environment               = var.environment
  vpc_cidr                  = var.vpc_cidr
  public_subnet             = var.public_subnet
  private_subnet            = var.private_subnet
  database_subnet           = var.database_subnet
  availability_zones        = var.availability_zones
  cidr_block                = var.cidr_block
  route_table_id            = var.route_table_id
  subnet_id                 = var.subnet_id
  id_app                    = module.ec2.id_app
  load_balancer_type        = var.load_balancer_type
  app_alb                   = var.app_alb
  alb_internal              = var.alb_internal
  load_balancer_arn         = var.load_balancer_arn
  alb_listener_port         = var.alb_listener_port
  alb_listener_protocol     = var.alb_listener_protocol
  alb_listener_type         = var.alb_listener_type
  alb_target_group_arn      = var.alb_target_group_arn
  alb_target_group          = var.alb_target_group
  alb_target_group_port     = var.alb_target_group_port
  alb_target_group_protocol = var.alb_target_group_protocol
  app_autoscaling_group     = var.app_autoscaling_group
  desired_capacity          = var.desired_capacity
  max_size                  = var.max_size
  min_size                  = var.min_size
  db_subnet_group_name      = var.db_subnet_group_name
  alb_security_group_name   = var.alb_security_group_name
  app_security_group_name   = var.app_security_group_name
  db_security_group_name    = var.db_security_group_name
  app_security_group        = var.app_security_group
}

module "ec2" {
  source             = "../../modules/ec2"
  project_name       = var.project_name
  environment        = var.environment
  image_id           = var.image_id
  instance_type      = var.instance_type
  app_security_group = module.VPC.app_security_group
  name_prefix        = var.name_prefix
  key_name           = var.key_name
  connection_type    = var.connection_type
  connection_user    = var.connection_user
  connection_host    = var.connection_host
}

module "sns" {
  source = "../../modules/sns/"
  discord_webhook_url = var.discord_webhook_url
  role_lambda_arn = "arn:aws:iam::856971625808:role/service-role/SendDiscordNotification-role-3ue1jonw"
  sns_name = "DiscordNotificationTopic"
  aws_lambda_function_arn = var.aws_lambda_function_arn
}

module "cloudwatch" {
  source = "../../modules/cloudwatch"
  increase_ec2_arn = module.VPC.alb_policy_increase_ec2_arn
  decrease_ec2_arn = module.VPC.alb_policy_decrease_ec2_arn
  sns_topic_arn = module.sns.sns_topic_arn
  instance_id = module.ec2.id_app
}

module "rds" {
  source               = "../../modules/rds/"
  project_name         = var.project_name
  environment          = var.environment
  engine_name          = var.engine_name
  engine_version       = var.engine_version
  storage              = var.storage
  db_subnet_group_name = module.vpc.aws_db_subnet_group_main
  identifier           = var.identifier
  instance_class       = var.instance_class
  multi_az             = var.multi_az
  database_name        = var.database_name
  database_username    = var.database_username
  database_password    = var.database_password
  database_port        = var.database_port
  publicly_accessible  = var.publicly_accessible
  db_security_group    = module.vpc.db_security_group
  database_snapshot    = var.database_snapshot
  backup_retention_period = var.backup_retention_period
  backup_window = var.backup_window
  maintenance_window = var.maintenance_window
}
