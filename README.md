## About

Terraform module to create IAM user with rights:

* Assume specified roles
* Manage own Access keys

Best practice is to have an IAM login with restricted rights. You may use it on a day-to-day basis 
for various AWS accounts with different IAM roles to assume temporary privileges. 

**NB!** after user creation you should login to AWS console and finish the rest steps:
* Activate virtual MFA
* Get access and secret keys

### Params

* `name` - User name
* `roles` - list of role ARNs

## Usage
 
```
module "agent_smith" {
    source = "github.com/jetbrains-infra/terraform-aws-user?ref=v0.1.0"
    name   = "Agent.Smith"
    roles  = [
      "arn:aws:iam::123456789012:role/ExternalAdmin",
      "arn:aws:iam::323456789012:role/ReadOnlyS3Access",
    ]
}
```