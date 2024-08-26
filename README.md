# Cloud Infrastructure with Terraform

# Pre-requisites

- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [AWS Account](https://aws.amazon.com/free/)

- Make sure you have the AWS CLI installed and configured with your AWS account credentials.

# Deployment Steps

#### 1. Clone the repo

    git clone `https://github.com/S1mpleOW/three-tier-architecture` && cd `three-tier-architecture`

#### 2. Update the s3 bucket name to your own - `versions.tf`

```
    backend "s3" {
        bucket = "ENTER HERE"
        key    = "terraform.tfstate"
        region = "eu-west-2"
    }
```

#### 3. Update terraform variables

```bash
    cp terraform.tfvars.example terraform.tfvars
```

- Update the `terraform.tfvars` file with your own values

```bash
    image_id="<ami-id>"
    key_name="<key-name-existed-on-AWS-EC2>"
    database_name="<db-name>"
    database_username="<db-username>"
    database_password="<db-password>"
    discord_webhook_url="<discord-webhook-url>"
    aws_lambda_function_arn="<aws-lambda-function-arn>"
```

#### 3. Update `versions.tf`

```bash
    tfupdate terraform versions.tf && tfupdate provider aws versions.tf
```

#### 4. Access the relevant environment

```bash
    cd dev
```

#### 5. Initialise the Terraform working directory

```bash
    terraform init
```

#### 6. Create an execution plan

```bash
    terraform plan
```

#### 7. Apply the changes required to reach the desired state of the configuration

```bash
    terraform apply
```
