# Terraform demo
This is a terraform demo used in my Online Course (see www.newtech.academy).

## Usage
To use this example, you need to add a terraform.tfvars with the following content:
```
AWS_ACCESS_KEY = "YOUR ACCESS KEY"
AWS_SECRET_KEY = "YOUR SECRET KEY"
AWS_REGION = "eu-west-1"
AWS_USERID = "123456"
```
## Execute
Then execute the plan using terraform:
```
terraform plan   # to show the plan
terraform apply  # to apply the changes
```
