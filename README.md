# Terraform Import Demo

This project demonstrates how to use both the old and new Terraform import methods to bring existing infrastructure under Terraform management.

## Files

- `main.tf`: The main Terraform configuration file.

## Usage

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Import Existing Resources

#### **New Method: Using the Import Block (Terraform 1.5+)**
1. Add an `import` block to your `main.tf`:
   ```hcl
   resource "aws_instance" "myserver" {
     ami           = "ami-020cba7c55df1f615"    # Update to match your instance
     instance_type = "t2.micro"                 # Update to match your instance
   }

   import {
     to = aws_instance.myserver
     id = "i-00d6d02f60465886c"
   }
   ```
2. Run:
   ```bash
   terraform apply
   ```
3. After a successful import, **remove the import block** from your configuration. Keep the resource block to manage the resource going forward.

#### **Old Method: Using the CLI Command**
1. Your `main.tf` should contain only the resource block (no import block):
   ```hcl
   resource "aws_instance" "myserver" {
     ami           = "ami-020cba7c55df1f615"    # Update to match your instance
     instance_type = "t2.micro"                 # Update to match your instance
   }
   ```
2. Run:
   ```bash
   terraform import aws_instance.myserver i-00d6d02f60465886c
   ```

### 3. Plan and Apply
After importing (using either method), run:
```bash
terraform plan
terraform apply
```

## Notes
- The import block is only needed for the import operation. Remove it after import.
- The resource block must always be present and should match the actual configuration of your imported resource.
- Review the state file after import to confirm resources are tracked correctly.

## References
- [Terraform Import Documentation](https://developer.hashicorp.com/terraform/cli/import)
- [Terraform Import Blocks (New Method)](https://developer.hashicorp.com/terraform/language/import)
