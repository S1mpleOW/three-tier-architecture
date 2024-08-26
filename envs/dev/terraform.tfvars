project_name = "CK-three-tier-architecture"
region = "ap-southeast-1"
environment = "dev"
image_id = "ami-0d07675d294f17973"
instance_type = "t2.micro"
name_prefix = "app-launch-template"
key_name = "OpenedX_key"
connection_user = "ec2-user"
vpc_cidr = "10.0.0.0/16"
public_subnet = {
  "ap-southeast-1a" : "10.0.0.0/24",
  "ap-southeast-1b" : "10.0.1.0/24"
}
private_subnet = {
  "ap-southeast-1a" : "10.0.101.0/24",
  "ap-southeast-1b" : "10.0.102.0/24"
}
database_subnet = {
  "ap-southeast-1a" : "10.0.201.0/24",
  "ap-southeast-1b" : "10.0.202.0/24"
}
availability_zones = [
  "ap-southeast-1a",
  "ap-southeast-1b"
]
cidr_block="0.0.0.0/0"
engine_name="mysql"
storage="10"
identifier="ck-db-mysql-dev"
instance_class="db.t3.micro"
multi_az=false
database_name="dbmysql"
database_username="dbadmin"
database_password="ka260102"
publicly_accessible="false"
database_snapshot="true"
min_size=1
desired_capacity=1
max_size=3
discord_webhook_url="https://discord.com/api/webhooks/1272500325642801256/e1Ow5pwsQIG5UH6CDQZqp7UkfmZSNFo5d_rLRuRSnjvlr4kkO9uMgI4PsO2CrslMFsF0"
aws_lambda_function_arn="arn:aws:lambda:ap-southeast-1:856971625808:function:SendDiscordNotification"
