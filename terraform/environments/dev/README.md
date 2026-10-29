# Development environment

This directory contains a minimal Azure foundation example: resource group, virtual network, and two subnets. It is intentionally small so the code can be validated before more services are added.

## Run

```bash
az login
az account set --subscription "<SUBSCRIPTION_ID>"
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars locally. Never commit subscription details.
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```

The example subnet prefixes assume `10.80.0.0/16`; confirm these ranges do not overlap with on-premises or other Azure networks before deployment. The management subnet does not itself enable secure management access; no public IP, Bastion, route tables, firewall or NSG is provisioned by this starter. Review and extend the architecture for your requirements.

Review the complete plan and expected costs before apply. Destroy only resources created by this lab after confirming that no dependent resources or valuable data remain.