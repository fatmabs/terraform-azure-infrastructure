# ☁️ Azure Infrastructure with Terraform

Infrastructure as Code (IaC) project for provisioning **scalable and secure Azure infrastructure** across multiple environments using **modular Terraform configurations**.

The project separates environment-specific configurations from reusable Terraform modules, enabling consistent and maintainable infrastructure deployments.

---

## 🏗️ Architecture Overview

The project follows a **modular Terraform architecture**:

* Environment-specific configurations are located under `environments/`
* Reusable Terraform modules are located under `modules/`
* Each environment has its own configuration and state
* Azure resources are organized into dedicated Resource Groups
* Security is managed using Azure Key Vault and RBAC

```text
terraform-azure-infrastructure/
│
├── docs/
│   └── architecture.md
│   └── screenshots
│
├── environments/
│   ├── dev/
│   │   ├── compute.tf
│   │   ├── network.tf
│   │   ├── security.tf
│   │   ├── storage.tf
│   │   ├── providers.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   │
│   └── prod/
│   │   ├── compute.tf
│   │   ├── network.tf
│   │   ├── security.tf
│   │   ├── storage.tf
│   │   ├── providers.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│
└── modules/
    ├── key-vault/
    ├── network-interface/
    ├── network-security-group/
    ├── resource-group/
    ├── storage-account/
    ├── subnet/
    ├── virtual-machine/
    └── virtual-network/
```

---

## 🖼️ Architecture Diagram

The infrastructure is organized around four main areas:

**Networking → Compute → Security → Storage**

```text

                         GitHub Repository
                                │
                                ▼
                       Terraform / IaC
                                │
              ┌─────────────────┴─────────────────┐
              │                                   │
         Environment                         Reusable
          dev / prod                          Modules
              │
              ▼
       ☁️ Azure Subscription
              │
     ┌────────┼───────────┬──────────────┐
     │        │           │              │
     ▼        ▼           ▼              ▼
  Network   Compute     Security       Storage
     │        │           │              │
     │        │           │              └── Storage Account
     │        │           │
     │        │           └── Key Vault
     │        │
     │        ├── Public IP
     │        ├── Network Interface
     │        ├── Linux VM
     │        └── OS Disk
     │
     ├── Virtual Network
     ├── Subnet
     └── Network Security Group
    
```
---

## ☁️ Deployed Resources

Each environment can provision the following Azure resources:

| Resource                   | Description                                                   |
| -------------------------- | ------------------------------------------------------------- |
| **Resource Groups**        | Separate groups for compute, networking, security and storage |
| **Virtual Network**        | Configurable Azure VNet                                       |
| **Subnet**                 | Dedicated subnet for workloads                                |
| **Network Security Group** | Controls inbound and outbound network traffic                 |
| **Network Interface**      | Connects the VM to the Azure network                          |
| **Virtual Machine**        | Ubuntu Server 22.04 LTS Gen2                                  |
| **Key Vault**              | Secure secret management with Azure RBAC                      |
| **Storage Account**        | Azure Blob Storage with unique naming                         |
| **Managed Disk**           | OS disk attached to the virtual machine                       |
| **Public IP**              | Public network connectivity for the VM                        |

### Resource Naming

Resources follow environment-based naming conventions:

```text
<environment>-<prefix>-<resource>
```

Examples:

```text
dev-compute-rg
dev-network-vnet
dev-network-nsg
dev-compute-nic
dev-compute-vm
dev-security-kv-<random>
```

---

## 🧩 Terraform Modules

The infrastructure is built using reusable Terraform modules:

| Module                   | Purpose                                |
| ------------------------ | -------------------------------------- |
| `resource-group`         | Creates Azure Resource Groups          |
| `virtual-network`        | Creates the VNet                       |
| `subnet`                 | Creates subnets                        |
| `network-security-group` | Configures NSGs and security rules     |
| `network-interface`      | Creates VM network interfaces          |
| `virtual-machine`        | Provisions Ubuntu VMs                  |
| `key-vault`              | Creates and configures Azure Key Vault |
| `storage-account`        | Provisions Azure Storage               |

This structure allows the same modules to be reused across different environments.

---

## 🔐 Security & Best Practices

### Azure RBAC

Azure Key Vault uses **Role-Based Access Control** for authorization.

```hcl
rbac_authorization_enabled = true
```

### Secret Management

Sensitive VM credentials are generated using Terraform and stored in **Azure Key Vault** rather than being exposed directly in the infrastructure configuration.

### Network Security

Network access is controlled through **Network Security Groups (NSGs)** associated with the infrastructure.

### Resource Tagging

Resources are automatically tagged to improve identification and management:

```text
Environment = dev / prod
ManagedBy   = Terraform
```

### State Isolation

Each environment maintains its own Terraform state.

For production usage, the recommended approach is to configure an **Azure Storage backend** for remote state management.

---

## 🛠️ Prerequisites

Before deploying the infrastructure, make sure you have:

* **Terraform** `>= 1.0.0`
* **Azure CLI**
* An active **Azure Subscription**
* Appropriate Azure permissions (`Contributor` or `Owner`)

Verify your installations:

```bash
terraform version
az version
```

---

## 🚀 Deployment

### 1. Authenticate with Azure

```bash
az login
```

Select the target subscription:

```bash
az account set --subscription "<YOUR_SUBSCRIPTION_ID>"
```

### 2. Select an Environment

For development:

```bash
cd environments/dev
```

For production:

```bash
cd environments/prod
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Validate the Configuration

```bash
terraform validate
```

### 5. Review the Deployment Plan

```bash
terraform plan
```

### 6. Deploy the Infrastructure

```bash
terraform apply
```

### 7. Destroy the Infrastructure

When the environment is no longer required:

```bash
terraform destroy
```

---

## 🔄 Terraform Workflow

```text
              Terraform Configuration
                        │
                        ▼
                terraform init
                        │
                        ▼
              terraform validate
                        │
                        ▼
                 terraform plan
                        │
                        ▼
                terraform apply
                        │
                        ▼
               ☁️ Azure Resources
```

---

## 📊 Infrastructure Organization

Azure resources are separated into dedicated Resource Groups:

```text
Azure Subscription
│
├── dev-compute-rg
│   ├── Network Interface
│   ├── Virtual Machine
│   └── Managed Disk
│
├── dev-network-rg
│   ├── Virtual Network
│   └── Network Security Group
│
├── dev-security-rg
│   └── Key Vault
│
└── NetworkWatcherRG
    └── Azure Network Watcher
```

The same structure can be reproduced for the production environment.

---

## 🎯 Skills Demonstrated

**Azure · Terraform · Infrastructure as Code · Terraform Modules · Azure Networking · NSG · Virtual Machines · Key Vault · Azure RBAC · Resource Groups ·  Git **

---

## 🔮 Future Improvements

* Configure Azure Storage as the Terraform remote backend
* Implement GitHub Actions CI/CD
* Use OIDC authentication for GitHub Actions
* Add Terraform security scanning with Checkov
* Add Azure Monitor and Log Analytics
* Add automated infrastructure testing
* Implement Azure Policy
* Add private endpoints
* Add cost estimation with Infracost

---

## 👩‍💻 Author

**Fatma Ben Slim**

*Cloud / DevOps Engineer | Azure | Terraform | CI/CD*
