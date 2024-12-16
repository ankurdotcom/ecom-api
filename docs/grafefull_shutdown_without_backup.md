### 1. **Check the Current State**

Run the following command to verify the resources that are currently being managed by Terraform:
```
terraform state list
```
This ensures you know which resources Terraform is tracking and will destroy.

### 2. **Run a Terraform Plan for Destruction**
To preview the resources that will be destroyed, run the following command:
```
terraform plan -destroy
```

This step helps confirm the scope of the destruction and avoid accidental deletion of unintended resources.


### 3. **Destroy All Resources**

Execute the terraform destroy command to remove all resources:
```
terraform destroy
```
 
 Terraform will prompt for confirmation before proceeding with the destruction.

Use -auto-approve to skip the confirmation prompt:
```
terraform destroy -auto-approve
```

### Note : In case any resource deletion failed check in main.tf file of associated module and add **deletion_protection = false** in resource 

```
resource "google_sql_database_instance" "default" {
  name             = var.instance_name
  database_version = "POSTGRES_14"
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }
  **deletion_protection = false**
}

```