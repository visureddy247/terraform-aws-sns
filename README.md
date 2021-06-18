# Terraform Amazon SNS Module
**Authors** : Rahul Gaikwad (gikwadr@amazon.com), Jomcy Pappachen (jomcy@amazon.com)

This Terraform module will create an Amazon Simple Notification Service (SNS) Topic with other resources. 

## Repository directory structure 
* **deploy/** contains .tf configuration files and `dev.auto.tfvars` to define default variables.

# Install Terraform
To deploy this module, do the following:
Install Terraform. (See [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) for a tutorial.) 

# Sign up for Terraform Cloud
Sign up and log into [Terraform Cloud](https://app.terraform.io/signup/account). (There is a free tier available.)

## Configure Terraform Cloud API Access

Generate terraform cloud token

`terraform login` 

Export the TERRAFORM_CONFIG variable

`export TERRAFORM_CONFIG="$HOME/.terraform.d/credentials.tfrc.json"`

# Configure your tfvars file

_Example filepath_ = `$HOME/.aws/terraform.tfvars`

_Example tfvars file contents_ 

```
AWS_SECRET_ACCESS_KEY = "*****************"
AWS_ACCESS_KEY_ID = "*****************"
AWS_SESSION_TOKEN = "*****************"
```
> (replace *** with AKEY and SKEY)

Note: STS-based credentials _are optional_ but *highly recommended*. 

> !!!!CAUTION!!!!: Make sure your credential are secured ourside version control (and follow secrets mangement bestpractices)

# Deploy this module (instruction for linux or mac)

Clone the aws-ia/terraform-aws-sns repository.

`git clone https://github.com/aws-ia/terraform-aws-vpc`

Change directory to module root.

`cd terraform-aws-sns`.

Start by setting up you cloud workspace

`cd setup_workspace`. 

Run to following commands in order:

`terraform init`

`terraform apply`  or `terraform apply  -var-file="$HOME/.aws/terraform.tfvars"`.

Change directory to deploy dir (previous command auto generates backend.hcl)

`cd ../deploy`

 Open `dev.auto.tfvars` and edit the default values to match your enviornment. 
      - See [Protocols and endpoints](#table) later in this document for supported protocols and endpoint examples.

`terraform apply` or `terraform apply  -var-file="$HOME/.aws/terraform.tfvars"`. 

Terraform apply is run remotely in Terraform Cloud 

## Protocols and endpoints <a name='table'>

The following table shows the endpoint format for each supported protocol. 

| Protocol         |               Endpoint description                         | Argument      | Endpoint example |
| ---| :--- | --- | ---
| Amazon Kinesis Data Firehose | Delivers JSON-encoded messages to an Amazon Kinesis Data Firehose delivery stream. Endpoint is the ARN of a Kinesis Data Firehose delivery stream. | ```firehose```  |   ```arn:aws:firehose:us-east-1:123456789012:deliverystream/ticketUploadStream```  |
| Amazon SQS  | Delivers JSON-encoded messages to an Amazon SQS queue. Endpoint is the ARN of an SQS queue. | ```sqs``` |```arn:aws:sqs:us-west-2:123456789012:terraform-queue-too```  |   
| AWS Lambda  | Delivers JSON-encoded messages to an AWS Lambda function. Endpoint is the ARN of an AWS Lambda function.| lambda |  ```arn:aws:lambda:us-east-1:123456789012:function:sample-lambda```  |
| Email |  Delivers messages via SMTP. Endpoint is an email address. | ```email``` | ```test@example.com```|
| Email-JSON | Delivers JSON-encoded messages via SMTP. Endpoint is an email address.  |```email-json``` |   ```test@example.com```  |
| HTTP  | Delivers JSON-encoded messages via HTTP POST. Endpoint is a URL beginning with `http://`. | ```http``` | ``` http://www.example.com```  |
| HTTPS | Delivers JSON-encoded messages via HTTPS POST. Endpoint is a URL beginning with `https://`. | ```https``` |  ```https://www.example.com ```|
| Platform application endpoint | Delivers JSON-encoded messages to an EndpointArn for a mobile app and device. Endpoint is the EndpointArn of a mobile app and device. | ```application``` | ```arn:aws:sns:us-west-2:123456789012:endpoint/ADM/MyApplication/abcd1efg2hi4jk6lmnopqr```|
| SMS | Delivers text messages via SMS. Endpoint is the phone number of an SMS-enabled device. | ```sms``` |  ```+91 1234567890```|

             
  
