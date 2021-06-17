# Terraform Amazon SNS Module
**Authors** : Rahul Gaikwad (gikwadr@amazon.com), Jomcy Pappachen (jomcy@amazon.com)

This Terraform module will create an Amazon Simple Notification Service (SNS) Topic with other resources. 

## Repository directory structure 
* **deploy/** contains .tf configuration files and `dev.auto.tfvars` to define default variables.

## Prerequisites 
1. Install Terraform. For instructions and a video tutorial, see [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli). 
2. Sign up and log into Terraform Cloud. (There is a free tier available.)
3. Generate a Terraform Cloud token to configure Terraform Cloud API access.
   ```
      terraform login
      export TERRAFORM_CONFIG="$HOME/.terraform.d/credentials.tfrc.json"
   ```
4. If you don't have git installed, [install git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git). 

## Deploying the module
   
  1. Clone the **aws-quickstart/terraform-aws-sns** repository.
      ```
      git clone https://github.com/aws-quickstart/terraform-aws-sns
      ```
  2. Copy `dev.auto.tfvars` from the /deploy directory to the root directory.
  3. Rename the copy of `dev.auto.tfvars` in the root directory to `terraform.tfvars`.
  4. Open `terraform.tfvars` and edit the default values for **display_name**, **kms_master_key_id**, **access_type**, **protocol**, and **endpoint**. See "Protocols and endpoints" for supported protocols and endpoint examples.
  5. Add the following variables to `terraform.tfvars`. In the following example, replace values for AWS_SECRET_ACCESS_KEY, AWS_ACCESS_KEY_ID, and  AWS_SESSION_TOKEN with your information.
       ```  
      AWS_SECRET_ACCESS_KEY = "*****************"
      AWS_ACCESS_KEY_ID = "*****************"
      AWS_SESSION_TOKEN = "*****************"
      workspace_dir = ../deploy
      region        = us-east-1 //AWS region
      ```    
      Note: [AWS Security Token Service (AWS STS)](https://docs.aws.amazon.com/general/latest/gr/sts.html) credentials are optional but highly recommended. Ensure that your credential are secured outside version control and follow secrets management best practices. For more information, see [AWS Security Credentials](https://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html).
  
  5. Save `terraform.tfvars`.
  4. Change to the /deploy directory.
     ```
     cd ../deploy
     ```
  6. Initialize Terraform and create Terraform resources. Terraform apply is run remotely in Terraform Cloud.
      ```
     cd setup_workspace
     terraform init
     terraform apply -var-file="$HOME/.aws/terraform.tfvars"
      ```
  ## Protocols and endpoints 
Refer below reference table for supported protocol and endpoint example. 

        | Protocol         |               Endpoint Description                         | Argument      | Endpoint Example |
        | ---| :--- | --- | ---
        | Amazon Kinesis Data Firehose | Delivers JSON-encoded messages, endpoint is is the ARN of an Amazon Kinesis Data Firehose delivery stream | ```firehose```  |   ```arn:aws:firehose:us-east-1:123456789012:deliverystream/ticketUploadStream```  |
        | Amazon SQS  | Delivers JSON-encoded messages, endpoint is the ARN of an Amazon SQS queue | ```sqs``` |```arn:aws:sqs:us-west-2:123456789012:terraform-queue-too```  |   
        | AWS Lambda  | Delivers JSON-encoded messages, endpoint is the ARN of an AWS Lambda function.| lambda |  ```arn:aws:lambda:us-east-1:123456789012:function:sample-lambda```  |
        | Email |  Delivers messages via SMTP, endpoint is an email address. | ```email``` | ```test@example.com```|
        | Email-JSON | Delivers JSON-encoded messages via SMTP, endpoint is an email address.  |```email-json``` |   ```test@example.com```  |
        | HTTP  | Delivers JSON-encoded messages via HTTP POST, endpoint is a URL beginning with http:// | ```http``` | ``` http://www.example.com```  |
        | HTTPS | Delivers JSON-encoded messages via HTTPS POST, endpoint is a URL beginning with https:// | ```https``` |  ```https://www.example.com ```|
        | Platform application endpoint | Delivers JSON-encoded messages, endpoint is the endpoint ARN of a mobile app and device. | ```application``` | ```arn:aws:sns:us-west-2:123456789012:endpoint/ADM/MyApplication/abcd1efg2hi4jk6lmnopqr```|
        | SMS | Delivers text messages via SMS, endpoint is the phone number of an SMS-enabled device. | ```sms``` |  ```+91 1234567890```|

      
   
      Note : 
      ```
     - update the below  config values in *.tfvars file
          display_name, kms_master_key_id, access_type, protocol, endpoint, 
          An example can be found in the dev.auto.tfvars file.

      ```
     
  6. To perform operations locally , do the following: 
   
       a. Change directory to respective deploy dir and Initialize the `deploy` directory.
       b. Run `terraform init`.  
       c. Update your config values in *.tfvars file 
       d. Run `terraform apply` or `terraform apply  -var-file="$HOME/.aws/terraform.tfvars"`.

