# Development environment

The actual Terraform root configuration is in `terraform/`. This environment folder stores example inputs and planning notes; it is not a separate Terraform root module yet.

## Run the starter

```bash
az login
az account set --subscription "<SUBSCRIPTION_ID>"
cd terraform
cp environments/dev/terraform.tfvars.example terraform.tfvars
terraform init
terraform fmt -check -recursive
terraform validate
terraform plan
```

Edit `terraform.tfvars` locally and ensure the subscription ID and address space are correct. The example subnet ranges assume `10.80.0.0/16`; confirm they do not overlap with on-premises or other Azure networks.

The starter provisions only a resource group, VNet and two subnets. It does not provision a VPN/ExpressRoute gateway, firewall, NSGs, Bastion, Azure Migrate project, replication appliance, database migration service, Key Vault or monitoring resources. Add and validate those separately based on actual requirements.

Review the complete plan and expected cost before apply. Do not deploy to production from this starter. Destroy only lab resources created by this project after confirming that no dependent resources or valuable data remain.