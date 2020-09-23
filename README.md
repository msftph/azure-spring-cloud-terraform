# Azure Spring Cloud Terraform

Creates an azure spring cloud instance with terraform

## Configuration

### Authentication

You must setup authentication as specified in the azurerm terraform provider: 

* [Authenticating](https://www.terraform.io/docs/providers/azurerm/index.html#authenticating-to-azure)

### Variables

Change the values in the terraform.tfvars file to the values that match your environment

```tfvars
resource_group = "spring_cloud"
location = "East US"
private_key_path = "private_key_example"
```

## Run

```bash
terraform init
```

```bash
terraform plan
```

```bash
terraform apply
```